import 'package:flutter/material.dart';

import '../../Features/home/presentation/manger/app_cycle_cubit/app_cubit.dart';
import '../utils/cupertino_icons.dart';
import '../utils/function/show_toast.dart';
import '../utils/language/strings.dart';

class ChangeLanguageIcon extends StatelessWidget {
  const ChangeLanguageIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          AppCubit.get(context).changeLanguage();
          showToast(msg: sLanguageMessage(context), state: ToastStates.loading);
        },
        icon: const Icon(kLanguageIcon));
  }
}
