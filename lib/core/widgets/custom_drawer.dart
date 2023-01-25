import 'package:flutter/material.dart';

import '../../Features/home/presentation/manger/app_cycle_cubit/app_cubit.dart';
import '../utils/constants.dart';
import '../utils/styles/color_manager.dart';
import '../utils/styles/styles_manager.dart';
import 'custom_language_icon.dart';
import 'custom_log_out_icon.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var model = AppCubit.get(context).userModel;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          if (model.image != null)
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorManager.primary,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      model.image!,
                    ),
                  ),
                  const SizedBox(
                    width: kPadding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: getSemiStyle(
                              color: ColorManager.white, fontSize: 22),
                        ),
                        const SizedBox(
                          height: kPadding,
                        ),
                        Text(
                          model.email!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                              color: ColorManager.grey5, fontSize: 20),
                        ),
                        const SizedBox(
                          height: kMargin,
                        ),
                        Text(
                          model.phone!,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                              color: ColorManager.grey5, fontSize: 20),
                        ),
                        const SizedBox(
                          height: kMargin,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const ChangeLanguageIcon(inApp: true),
          const CustomLogOutIcon(),
        ],
      ),
    );
  }
}
