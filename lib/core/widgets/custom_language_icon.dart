import 'package:flutter/material.dart';

import '../../Features/home/presentation/manger/app_cycle_cubit/app_cubit.dart';
import '../utils/constants.dart';
import '../utils/cupertino_icons.dart';
import '../utils/function/show_toast.dart';
import '../utils/language/strings.dart';
import '../utils/styles/styles_manager.dart';

class ChangeLanguageIcon extends StatelessWidget {
  const ChangeLanguageIcon({
    this.inApp = false,
    Key? key,
  }) : super(key: key);
  final bool inApp;
  @override
  Widget build(BuildContext context) => inApp == false
      ? IconButton(
          onPressed: () {
            AppCubit.get(context).changeLanguage();
            showToast(
                msg: sLanguageMessage(context), state: ToastStates.loading);
          },
          icon: const Icon(kLanguageIcon))
      : InkWell(
          onTap: () {
            AppCubit.get(context).changeLanguage();
            showToast(
                msg: sLanguageMessage(context), state: ToastStates.loading);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding, vertical: kMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(kLanguageIcon),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  sLanguageChange(context),
                  style: getSemiStyle(),
                ),
              ],
            ),
          ));
}
