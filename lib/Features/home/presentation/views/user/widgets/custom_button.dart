import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles/color_manager.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const CustomButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManager.grey, //color of border
          width: 1, //width of border
        ),
      ),
      child: MaterialButton(
          onPressed: onPressed,
          child: Center(
            child: child,
          )),
    );
  }
}
