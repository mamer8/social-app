import 'package:flutter/material.dart';

import '../../../../../core/utils/styles/styles_manager.dart';

Widget customText({required String text}) => Text(
      text,
      style: getBoldStyle(
        fontSize: 30,
      ),
      // TextStyle(
      //   fontSize: 30,
      //   fontWeight: FontWeight.bold,
      // ),
    );
