import 'package:flutter/material.dart';

import '../../../../../core/utils/function/navigation.dart';
import '../../../../../core/utils/language/strings.dart';
import '../../../../../core/utils/styles/color_manager.dart';
import '../../../../../core/utils/styles/styles_manager.dart';
import '../register_view.dart';
import 'login_view_body.dart';

class TextRow extends StatelessWidget {
  final int login1_register2;
  const TextRow({
    Key? key,
    required this.login1_register2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          login1_register2 == 1
              ? sDoNotHaveAccount(context)
              : sHaveAccount(context),
          style: getRegularStyle(),
        ),
        TextButton(
            onPressed: () {
              login1_register2 == 1
                  ? navigateTo(context, RegisterView())
                  : navigateTo(context, LoginViewBody());
            },
            child: Text(
              login1_register2 == 1 ? sRegister(context) : sLoginNow(context),
              style: getMediumStyle(color: ColorManager.primary),
            ))
      ],
    );
  }
}
