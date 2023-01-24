import 'package:flutter/material.dart';

import '../../../../../../core/utils/cupertino_icons.dart';
import '../../../../../../core/utils/language/strings.dart';
import '../../../../../../core/utils/styles/color_manager.dart';
import '../../../../../../core/utils/styles/styles_manager.dart';
import '../../../manger/app_cycle_cubit/app_cubit.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        AppCubit.get(context).getPostImage();
      },
      label: Container(
        //height: 20,
        decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Text(
              sAddPhoto(context),
              style: getSemiStyle(
                  color: ColorManager.white, fontHeight: 1, fontSize: 18),
            ),
            Icon(kPhotoIcon, color: ColorManager.white),
          ],
        ),
      ),
    );
  }
}
