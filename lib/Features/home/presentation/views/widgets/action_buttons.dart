import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles/color_manager.dart';
import '../../../../../core/utils/styles/styles_manager.dart';

class ButtonsSection extends StatelessWidget {
  final void Function()? likeOnTap;

  const ButtonsSection({
    Key? key,  this.likeOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          CustomActionButton(like1Comment2Share3: 1,onTap: likeOnTap),
          CustomActionButton(like1Comment2Share3: 2),
          CustomActionButton(like1Comment2Share3: 3,),
        ],
      ),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  final void Function()? onTap;
  final int like1Comment2Share3;
  const CustomActionButton({
    Key? key,
    this.onTap,
    required this.like1Comment2Share3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
              like1Comment2Share3 == 1
                  ? CupertinoIcons.hand_thumbsup
                  : like1Comment2Share3 == 2
                      ? CupertinoIcons.ellipses_bubble
                      : CupertinoIcons.arrowshape_turn_up_right,
              color: ColorManager.lightGrey,
              size: 24),
          const SizedBox(
            width: 7,
          ),
          Text(
            like1Comment2Share3 == 1
                ? 'Like'
                : like1Comment2Share3 == 2
                    ? 'Comment'
                    : 'Share',
            style: getRegularStyle(fontSize: 18, color: ColorManager.lightGrey),
          ),
        ],
      ),
    );
  }
}
