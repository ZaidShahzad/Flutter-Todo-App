import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final Function() onPressed;
  final Color color;

  const Button({
    super.key,
    required this.buttonName,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(buttonName),
    );
  }
}
