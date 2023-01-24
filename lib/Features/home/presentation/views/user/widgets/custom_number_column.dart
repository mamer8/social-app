import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles/styles_manager.dart';

class CustomNumbersColumn extends StatelessWidget {
  final String? number;
  final String text;
  const CustomNumbersColumn({
    Key? key,
    this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number ?? '0',
          style: getBoldStyle(),
        ),
        Text(
          text,
          style: getRegularStyle(fontHeight: 1.5, fontSize: 15),
        ),
      ],
    );
  }
}
