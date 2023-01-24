import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/cupertino_icons.dart';
import '../../../../../../core/utils/styles/color_manager.dart';
import '../../../../../../core/utils/styles/styles_manager.dart';

class CustomChatRow extends StatelessWidget {
  final String profileImage;
  final String name;
  const CustomChatRow({
    Key? key,
    required this.profileImage,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(kMargin),
          child: Hero(
            tag: 'image',
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                profileImage,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: getBoldStyle(fontHeight: 1.1, color: ColorManager.black),
            ),
            // Text(
            //   date,
            //   style: getRegularStyle(
            //       fontHeight: 1.1,
            //       fontSize: 12,
            //       color: ColorManager.hint2Grey),
            // ),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(kDotsIcon))
      ],
    );
  }
}
