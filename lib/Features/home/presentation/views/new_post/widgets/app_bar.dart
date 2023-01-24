import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/language/strings.dart';
import '../../../../../../core/utils/styles/color_manager.dart';
import '../../../../../../core/utils/styles/styles_manager.dart';
import '../../../manger/app_cycle_cubit/app_cubit.dart';

AppBar buildAppBar(BuildContext context, void Function() onTap) {
  return AppBar(
    title:  Text(sPostPage(context)),
    leading: IconButton(
        onPressed: () {
          AppCubit.get(context).postImage = null;
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios)),
    actions: [
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: InkWell(
            onTap: onTap,
            child: Container(
              //height: 20,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(kMargin),
                child: Text(
                  sPost(context),
                  style: getSemiStyle(
                      color: ColorManager.primary, fontHeight: 1, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
