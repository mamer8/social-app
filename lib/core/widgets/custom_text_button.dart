import 'package:flutter/material.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/styles_manager.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;
  const CustomTextButton(
      {Key? key, required this.text, required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: style ?? getMediumStyle(color: ColorManager.primary),
        ));
  }
}
