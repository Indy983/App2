import 'package:flutter/material.dart';
import 'utils.dart';
import 'content_renderer.dart';

class FillInQuestion extends StatefulWidget {
  final QuestionParams params;

  const FillInQuestion(this.params, {Key? key}) : super(key: key);

  @override
  State<FillInQuestion> createState() => _FillInQuestionState();
}

class _FillInQuestionState extends State<FillInQuestion> {
  late Map<String, TextEditingController> _controllers;
  late List<String> _boxIds;

  @override
  void initState() {
    super.initState();
    _extractBoxIds();
    _initControllers();
  }

  @override
  void didUpdateWidget(FillInQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.params.isChecked != widget.params.isChecked) {
      setState(() {});
    }
  }

  void _extractBoxIds() {
    _boxIds = [];
    var content = widget.params.data['content'];
    
    if (content is List) {
      for (var item in content) {
        if (item is Map && item.containsKey('box')) {
          _boxIds.add(item['box']);
        }
      }
    }
  }

  void _initControllers() {
    _controllers = {};
    
    if (_boxIds.length > 1 && widget.params.state[widget.params.id] is! Map) {
      widget.params.state[widget.params.id] = {};
    }
    
    for (var boxId in _boxIds) {
      String initialValue = _getInitialValue(boxId);
      _controllers[boxId] = TextEditingController(text: initialValue);
    }
  }

  String _getInitialValue(String boxId) {
    var state = widget.params.state[widget.params.id];
    
    if (_boxIds.length == 1) {
      return state?.toString() ?? '';
    }
    
    if (state is Map) {
      return state[boxId]?.toString() ?? '';
    }
    
    return '';
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onBoxChanged(String boxId, String value) {
    if (_boxIds.length == 1) {
      widget.params.state[widget.params.id] = value;
    } else {
      widget.params.state[widget.params.id] ??= {};
      widget.params.state[widget.params.id][boxId] = value;
    }
  }

  Color? _getBorderColor(String boxId) {
    var correctAnswer = widget.params.data['correctAnswers'] ?? 
                        widget.params.data['correct'];
    
    return getBorderColor(
      isChecked: widget.params.isChecked,
      userAnswer: widget.params.state[widget.params.id],
      correctAnswer: correctAnswer,
      key: _boxIds.length > 1 ? boxId : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    var content = widget.params.data['content'];
    if (content is String) content = [content];
    
    return ContentRenderer(
      content: content,
      state: widget.params.state,
      questionId: widget.params.id,
      isChecked: widget.params.isChecked,
      boxControllers: _controllers,
      onBoxChanged: _onBoxChanged,
      getBorderColor: _getBorderColor,
    );
  }
}