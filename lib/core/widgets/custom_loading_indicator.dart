import 'package:flutter/material.dart';

import '../utils/styles/color_manager.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: ColorManager.primary),
    );
  }
}
