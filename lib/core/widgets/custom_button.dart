import 'package:flutter/material.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/styles_manager.dart';
import '../utils/styles/font_manager.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final Color? textColor;
  final Color? buttonColor;

  final bool disabled;

  final double padding;
  const CustomButton(
      {super.key,
      required this.text,
      this.width,
      this.padding = 10,
      required this.onPressed,
      this.disabled = false,
      this.textColor,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: disabled
            ? [
                const BoxShadow(
                  color: Color(0xffABABAB),
                ),
                const BoxShadow(
                    color: Color(0xffABABAB),
                    spreadRadius: -2,
                    blurRadius: 2.0,
                    offset: Offset(0, -1)),
              ]
            : [
                BoxShadow(
                  color: buttonColor ?? Color(0xff245228),
                ),
                BoxShadow(
                    color: buttonColor ?? Color(0xff266933),
                    spreadRadius: -2,
                    blurRadius: 2.0,
                    offset: Offset(0, -1)),
              ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        disabledColor: Colors.grey,
        child: Text(
          text!,
          style: getSemiStyle(
              color: textColor ?? ColorManager.white, fontSize: FontSize.s20),
        ),
      ),
    );
  }
}
