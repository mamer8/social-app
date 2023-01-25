import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/cupertino_icons.dart';
import '../../../../core/utils/function/show_toast.dart';
import '../../../../core/utils/language/strings.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/custom_language_icon.dart';
import '../../../../core/widgets/custom_log_out_icon.dart';
import '../manger/app_cycle_cubit/app_cubit.dart';
import '../manger/app_cycle_cubit/app_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      sHomePage(context),
      sUserPage(context),
      sChatPage(context),
      // sNotificationsPage(context),
    ];
    List<BottomNavigationBarItem> navigationBarItems = [
      BottomNavigationBarItem(
        icon: const Icon(kHomeIcon),
        label: sHomePage(context),
      ),
      BottomNavigationBarItem(
        icon: const Icon(kPersonIcon),
        label: sUserPage(context),
      ),
      BottomNavigationBarItem(
        icon: const Icon(kChatIcon),
        label: sChatPage(context),
      ),
      // BottomNavigationBarItem(
      //   icon: const Icon(kBellIcon),
      //   label: sNotificationsPage(context),
      // ),
    ];
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(title: Text(titles[cubit.currentIndex])),
          //backgroundColor: Colors.green,
          body: SafeArea(child: cubit.navigationBarViews[cubit.currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: navigationBarItems,
            onTap: (index) {
              cubit.changeNavigationBar(index);
            },
          ),
        );
      },
    );
  }
}
