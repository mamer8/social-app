import 'package:flutter/material.dart';

import '../../../../core/utils/styles/color_manager.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key, required this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SplashViewBody(widget: widget),
    );
  }
}
