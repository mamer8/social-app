import 'package:flutter/material.dart';
import '../../../../../core/utils/language/strings.dart';
import '../../../../../core/utils/styles/styles_manager.dart';

import '../../../../../core/utils/styles/color_manager.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              sAppName(context),
              style: getRegularStyle(color: ColorManager.black),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
