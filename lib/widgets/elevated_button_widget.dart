import 'package:flutter/material.dart';

class ElevatedbuttonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String name;
  final void Function() onPressed;
  const ElevatedbuttonWidget({
    Key? key,
    required this.backgroundColor,
    required this.name,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(360, 55),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey),
          )),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: textColor),
      ),
    );
  }
}
