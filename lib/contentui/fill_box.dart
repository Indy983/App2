import 'package:flutter/material.dart';

class FillBox extends StatelessWidget {
  final String boxId;
  final TextEditingController controller;
  final Color? borderColor;
  final bool enabled;
  final void Function(String value)? onChanged;

  const FillBox({
    Key? key,
    required this.boxId,
    required this.controller,
    this.borderColor,
    this.enabled = true,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: enabled ? Colors.black : Colors.black87,
        ),
        decoration: InputDecoration(
          hintText: "เติมคำ",
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.grey[300]!,
              width: borderColor != null ? 2 : 1,
            ),
          ),
        ),
      ),
    );
  }
}