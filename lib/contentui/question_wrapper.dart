import 'package:flutter/material.dart';
import 'utils.dart';
import 'choice_question.dart';
import 'fillin_question.dart';
import 'dragdrop_question.dart';
import 'math_content_parser.dart';

class QuestionWrapper extends StatefulWidget {
  final String questionType;
  final QuestionParams params;
  final Map<String, bool> checkedStates;
  final Map<String, int> attemptCounts;

  const QuestionWrapper({
    Key? key,
    required this.questionType,
    required this.params,
    required this.checkedStates,
    required this.attemptCounts,
  }) : super(key: key);

  @override
  State<QuestionWrapper> createState() => _QuestionWrapperState();
}

class _QuestionWrapperState extends State<QuestionWrapper> {
  bool get isChecked => widget.checkedStates[widget.params.id] ?? false;

  Widget _buildQuestionWidget() {
    final updatedParams = QuestionParams(
      id: widget.params.id,
      data: widget.params.data,
      state: widget.params.state,
      lessonId: widget.params.lessonId,
      database: widget.params.database,
      syncService: widget.params.syncService,
      isChecked: isChecked,
      checkedStates: widget.checkedStates,
      attemptCounts: widget.attemptCounts,
    );

    switch (widget.questionType) {
      case 'choice':
        return ChoiceQuestion(updatedParams);
      case 'fillin':
        return FillInQuestion(updatedParams);
      case 'dragdrop':
        return DragDropQuestion(updatedParams);
      default:
        return const SizedBox.shrink();
    }
  }

  bool _checkAnswer() {
    return checkAnswer(
      widget.params.state[widget.params.id],
      widget.params.data['correctAnswers'] ?? widget.params.data['correct'],
    );
  }

  Future<void> _handleCheck() async {
    setState(() {
      widget.checkedStates[widget.params.id] = true;
    });
    
    bool correct = _checkAnswer();

    await widget.params.database.saveAnswer(
      widget.params.lessonId,
      widget.params.id,
      widget.params.state[widget.params.id],
    );

    await widget.params.database.checkAnswer(
      widget.params.lessonId,
      widget.params.id,
      correct,
    );

    widget.attemptCounts[widget.params.id] = 
        (widget.attemptCounts[widget.params.id] ?? 0) + 1;

    await widget.params.syncService.writeAnswer(
      lessonId: widget.params.lessonId,
      questionId: widget.params.id,
      answerData: widget.params.state[widget.params.id],
    );

    await widget.params.syncService.checkAnswer(
      lessonId: widget.params.lessonId,
      questionId: widget.params.id,
      isCorrect: correct,
    );
  }

  Future<void> _handleRetry() async {
    await widget.params.syncService.retryQuestion(
      lessonId: widget.params.lessonId,
      questionId: widget.params.id,
    );

    widget.params.state.remove(widget.params.id);
    widget.checkedStates[widget.params.id] = false;
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isCorrect = widget.params.state[widget.params.id] != null && 
                     _checkAnswer();
    
    // DragDrop handles its own check/retry buttons
    bool showButtons = widget.questionType != 'dragdrop';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuestionWidget(),
        if (showButtons) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: isChecked ? null : _handleCheck,
                child: const Text("ตรวจคำตอบ"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _handleRetry,
                child: const Text("ลองใหม่"),
              ),
            ],
          ),
          if (isChecked) _buildFeedback(isCorrect),
        ],
      ],
    );
  }

  Widget _buildFeedback(bool isCorrect) {
    String? explanation = widget.params.data['explanation'];
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8),
      color: isCorrect ? Colors.green[50] : Colors.red[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MathContentParser.buildSmall(
            isCorrect ? "ถูกต้อง! ✅" : "ลองใหม่นะ ❌",
            fontWeight: FontWeight.bold,
          ),
          if (explanation != null && explanation.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: MathContentParser.buildSmall(explanation),
            ),
        ],
      ),
    );
  }
}