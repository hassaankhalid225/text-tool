import 'package:flutter/material.dart';

class TextInputCard extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  
  const TextInputCard({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 6,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
