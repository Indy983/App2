import 'package:flutter/material.dart';
import 'utils.dart';
import 'content_renderer.dart';
import 'math_content_parser.dart';

class ChoiceQuestion extends StatefulWidget {
  final QuestionParams params;

  const ChoiceQuestion(this.params, {Key? key}) : super(key: key);

  @override
  State<ChoiceQuestion> createState() => _ChoiceQuestionState();
}

class _ChoiceQuestionState extends State<ChoiceQuestion> {
  void _selectOption(String option) {
    if (!widget.params.isChecked) {
      setState(() {
        widget.params.state[widget.params.id] = option;
      });
    }
  }

  @override
  void didUpdateWidget(ChoiceQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.params.isChecked != widget.params.isChecked) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var content = widget.params.data['content'];
    if (content is String) content = [content];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContentRenderer(content: content),
        const SizedBox(height: 12),
        ..._buildOptions(),
      ],
    );
  }

  List<Widget> _buildOptions() {
    List options = widget.params.data['options'];
    String? selected = widget.params.state[widget.params.id];
    String correct = widget.params.data['correct'];

    return options.map<Widget>((option) {
      bool isSelected = selected == option;
      bool isCorrect = option == correct;
      Color? borderColor = _getBorderColor(isSelected, isCorrect);

      return GestureDetector(
        onTap: widget.params.isChecked ? null : () => _selectOption(option),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[50] : Colors.grey[100],
            border: Border.all(
              color: borderColor ?? 
                     (isSelected ? Colors.blue : Colors.grey[300]!),
              width: borderColor != null ? 3 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MathContentParser.buildSmall(option),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Color? _getBorderColor(bool isSelected, bool isCorrect) {
    if (!widget.params.isChecked || !isSelected) return null;
    return isCorrect ? Colors.green : Colors.red;
  }
}