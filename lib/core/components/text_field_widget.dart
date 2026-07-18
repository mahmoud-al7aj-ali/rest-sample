import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.label,
    this.validator,
    this.controller,
  });

  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder();
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if(label != null || label!.isNotEmpty)
        Text(label!),
        TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            border: border
          ),
        ),
      ],
    );
  }
}
