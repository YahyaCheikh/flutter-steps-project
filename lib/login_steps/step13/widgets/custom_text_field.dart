
import 'package:flutter/material.dart';

class CastumTextFormField extends StatelessWidget {
  const CastumTextFormField({
    super.key,
    required this.textEditingController,
    required this.isObscure,
    required this.hintText,
  });

  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[500]!),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none),
        controller: textEditingController,
      ),
    );
  }
}
