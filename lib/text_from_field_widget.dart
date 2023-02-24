// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  const TextFromFieldWidget({
    Key? key,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<TextFromFieldWidget> createState() => _TextFromFieldWidgetState();
}

class _TextFromFieldWidgetState extends State<TextFromFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon, color: Colors.deepPurple),
            suffixIcon: widget.suffixIcon,
            label: Text(
              widget.label,
              style: const TextStyle(fontSize: 14),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.white)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5))));
  }
}
