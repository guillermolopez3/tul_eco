import 'package:flutter/material.dart';

class ButtonPrincipal extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color backgroundColor;
  final Color textColor;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const ButtonPrincipal(
      {Key? key,
      required this.text,
      required this.press,
      this.backgroundColor = Colors.red,
      this.textColor = Colors.white,
      this.leftIcon,
      this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leftIcon != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: leftIcon,
            ),
          Text(
            text.toUpperCase(),
          ),
          if (rightIcon != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: rightIcon,
            ),
        ],
      ),
    );
  }
}
