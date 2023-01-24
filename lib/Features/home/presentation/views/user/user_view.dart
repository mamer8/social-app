import 'package:flutter/material.dart';
import 'package:socialapp/Features/home/presentation/views/user/widgets/profile_section.dart';

class UserViewBody extends StatelessWidget {
  const UserViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileSection(),
        ],
      ),
    );
  }
}
