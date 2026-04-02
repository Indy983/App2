import 'package:flutter/material.dart';
import 'utils.dart';
import 'content_renderer.dart';
import 'math_content_parser.dart';
import 'graph_registry.dart';

class DragDropQuestion extends StatelessWidget {
  final QuestionParams params;

  const DragDropQuestion(this.params, {Key? key}) : super(key: key);

  List<Map> get _steps {
    final steps = params.data['steps'];
    return (steps is List) ? steps.cast<Map>() : [params.data];
  }

  @override
  Widget build(BuildContext context) {
    final steps = _steps;
    final isMultiStep = steps.length > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          _buildStepCard(
            stepNumber: isMultiStep ? i + 1 : null,
            child: _DragDropStep(
              // เพิ่ม ValueKey เพื่อบังคับให้โหลด State ใหม่เสมอ ป้องกัน State Leak
              key: ValueKey(steps[i]['questionId'] ?? '${params.id}_$i'),
              questionId: steps[i]['questionId'] ?? params.id,
              stepData: steps[i],
              parentParams: params,
            ),
          ),
          if (i < steps.length - 1) _buildConnector(),
        ],
      ],
    );
  }

  Widget _buildStepCard({int? stepNumber, required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFECB3), Color(0xFFFFF9C4)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFB300), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (stepNumber != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFB300), Color(0xFFFFA000)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$stepNumber',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, stepNumber == null ? 24 : 0, 24, 24),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildConnector() {
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.more_vert, color: Colors.grey[400], size: 24),
          Icon(Icons.arrow_downward, color: Colors.grey[400], size: 20),
        ],
      ),
    );
  }
}

// ─── Step ────────────────────────────────────────────────────────────────────

class _DragDropStep extends StatefulWidget {
  final String questionId;
  final Map stepData;
  final QuestionParams parentParams;

  const _DragDropStep({
    Key? key, // เพิ่มการรับ Key ตรงนี้
    required this.questionId,
    required this.stepData,
    required this.parentParams,
  }) : super(key: key); // ส่งผ่าน Key ให้กับ super

  @override
  State<_DragDropStep> createState() => _DragDropStepState();
}

class _DragDropStepState extends State<_DragDropStep> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    // Ensure state map exists once — not on every build
    if (widget.parentParams.state[widget.questionId] is! Map) {
      widget.parentParams.state[widget.questionId] = {};
    }
    _isChecked = widget.parentParams.checkedStates?[widget.questionId] ?? false;
  }

  void _onDropAccept(String zoneId, String value) {
    if (_isChecked) return;
    setState(() {
      widget.parentParams.state[widget.questionId][zoneId] = value;
    });
  }

  Color? _getBorderColor(String zoneId) => getBorderColor(
        isChecked: _isChecked,
        userAnswer: widget.parentParams.state[widget.questionId],
        correctAnswer: widget.stepData['correctAnswers'],
        key: zoneId,
      );

  bool _checkAnswer() => checkAnswer(
        widget.parentParams.state[widget.questionId],
        widget.stepData['correctAnswers'],
      );

  Future<void> _handleCheck() async {
    setState(() => _isChecked = true);
    widget.parentParams.checkedStates?[widget.questionId] = true;
    widget.parentParams.attemptCounts?[widget.questionId] =
        (widget.parentParams.attemptCounts![widget.questionId] ?? 0) + 1;

    final correct = _checkAnswer();
    final userAnswer = widget.parentParams.state[widget.questionId];

    await widget.parentParams.database.saveAnswer(
        widget.parentParams.lessonId, widget.questionId, userAnswer);
    await widget.parentParams.database.checkAnswer(
        widget.parentParams.lessonId, widget.questionId, correct);
    await widget.parentParams.syncService.writeAnswer(
        lessonId: widget.parentParams.lessonId,
        questionId: widget.questionId,
        answerData: userAnswer);
    await widget.parentParams.syncService.checkAnswer(
        lessonId: widget.parentParams.lessonId,
        questionId: widget.questionId,
        isCorrect: correct);
  }

  Future<void> _handleRetry() async {
    await widget.parentParams.syncService.retryQuestion(
        lessonId: widget.parentParams.lessonId, questionId: widget.questionId);
    widget.parentParams.state.remove(widget.questionId);
    widget.parentParams.state[widget.questionId] = {};
    widget.parentParams.checkedStates?[widget.questionId] = false;
    setState(() => _isChecked = false);
  }

  @override
  Widget build(BuildContext context) {
    var content = widget.stepData['content'];
    if (content is String) content = [content];

    final isCorrect =
        widget.parentParams.state[widget.questionId] != null && _checkAnswer();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContentRenderer(
          content: content,
          state: widget.parentParams.state,
          questionId: widget.questionId,
          isChecked: _isChecked,
          onDropAccept: _onDropAccept,
          getBorderColor: _getBorderColor,
        ),
        const SizedBox(height: 12),
        // Draggable items — supports String (plain/LaTeX) and Map (graph)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: (widget.stepData['draggableItems'] as List)
              .map<Widget>((item) => _DraggableItem(
                    item: item,
                    isDisabled: _isChecked,
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: _isChecked ? null : _handleCheck,
              icon: const Icon(Icons.check_circle, size: 20),
              label: const Text("Check Answer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB300),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: _handleRetry,
              icon: const Icon(Icons.refresh, size: 20),
              label: const Text("Retry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.grey[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
        if (_isChecked) _buildFeedback(isCorrect),
      ],
    );
  }

  Widget _buildFeedback(bool isCorrect) {
    final explanation = widget.stepData['explanation'] as String?;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: isCorrect ? const Color(0xFFE8F5E9) : const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              isCorrect ? const Color(0xFF43A047) : const Color(0xFFFFA726),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(isCorrect ? '✅' : '❌',
                  style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isCorrect
                      ? 'Excellent! Quest Completed!'
                      : 'Try Again! You can do it!',
                  style: TextStyle(
                    color: isCorrect
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFF57C00),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          if (explanation != null && explanation.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: MathContentParser.buildSmall(explanation),
            ),
        ],
      ),
    );
  }
}

class _DraggableItem extends StatelessWidget {
  final dynamic item;
  final bool isDisabled;

  const _DraggableItem({required this.item, required this.isDisabled});

  // Encode graph map → drag token
  String get _dragData {
    if (item is Map) return 'graph:${(item as Map)['graph']}';
    return item as String;
  }

  Widget _buildContent({bool isGraph = false}) {
    if (item is Map) {
      final path = (item as Map)['graph'] as String;
      final label = (item as Map)['label'] as String?;
      return _GraphChip(path: path, label: label);
    }
    // String — MathContentParser handles plain text and LaTeX transparently
    return _TextChip(text: item as String);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: Draggable<String>(
        data: _dragData,
        feedback: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
          child: _buildContent(),
        ),
        childWhenDragging: Opacity(opacity: 0.3, child: _buildContent()),
        child: _buildContent(),
      ),
    );
  }
}

class _TextChip extends StatelessWidget {
  final String text;
  const _TextChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFB300), width: 1.5),
        boxShadow: [
          BoxShadow(
              color: Colors.amber.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2)),
        ],
      ),
      // ถอด IntrinsicWidth ออกเพื่อแก้ไขปัญหา Layout กับ LaTeX และเพิ่ม Performance อย่างเห็นได้ชัด
      child: MathContentParser.buildSmall(text),
    );
  }
}

class _GraphChip extends StatelessWidget {
  final String path;
  final String? label;
  const _GraphChip({required this.path, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFB300), width: 1.5),
        boxShadow: [
          BoxShadow(
              color: Colors.amber.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 100,
              child: GraphRegistry.getGraph(path),
            ),
          ),
          if (label != null && label!.isNotEmpty) ...[
            const SizedBox(height: 4),
            MathContentParser.buildSmall(label!, color: Colors.grey[700]),
          ],
        ],
      ),
    );
  }
}