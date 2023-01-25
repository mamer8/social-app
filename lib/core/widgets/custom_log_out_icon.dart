import 'package:flutter/material.dart';
import 'package:socialapp/Features/Login/presentation/views/login_view.dart';
import 'package:socialapp/core/utils/function/navigation.dart';
import 'package:socialapp/core/utils/styles/styles_manager.dart';

import '../../Features/home/presentation/manger/app_cycle_cubit/app_cubit.dart';
import '../utils/constants.dart';
import '../utils/cupertino_icons.dart';
import '../utils/function/show_toast.dart';
import '../utils/language/strings.dart';

class CustomLogOutIcon extends StatelessWidget {
  const CustomLogOutIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          kUID = null;
          showToast(msg: sLogoutMessage(context), state: ToastStates.loading);
          navigateAndReplace(context, const LoginView());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kPadding, vertical: kMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(kLogoutIcon),
              const SizedBox(
                width: 10,
              ),
              Text(
                sLogOut(context),
                style: getSemiStyle(),
              ),
            ],
          ),
        ));
  }
}
