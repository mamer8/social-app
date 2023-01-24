import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/cupertino_icons.dart';
import '../../../../../core/utils/styles/color_manager.dart';
import '../../../../../core/utils/styles/styles_manager.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import 'action_buttons.dart';
import 'comment_section.dart';
import 'custom_divider.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String date;
  final String profileImage;
  String? postImage;
  final String text;
  final int likes;
  final int comments;
  final void Function()? likeOnTap;

  PostWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.profileImage,
    this.postImage,
    required this.text,
    required this.likes,
    required this.comments,
    this.likeOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kMargin),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      profileImage,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: getBoldStyle(
                          fontHeight: 1.1, color: ColorManager.black),
                    ),
                    Text(
                      date,
                      style: getRegularStyle(
                          fontHeight: 1.1,
                          fontSize: 12,
                          color: ColorManager.hint2Grey),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(kDotsIcon))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMargin),
              child: ReadMoreText(
                text,
                trimLines: 3,
                style: getRegularStyle(color: Colors.black, fontSize: 15),
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: 'Show less',
                lessStyle: getRegularStyle(color: ColorManager.hint2Grey),
                moreStyle: getRegularStyle(color: ColorManager.hint2Grey),
              ),
            ),
            const SizedBox(
              height: kMargin,
            ),
            postImage != ''
                ? Container(
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(postImage!),
                            fit: BoxFit.cover)),
                  )
                : Container(
                    child: null,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMargin),
              child: Row(
                children: [
                  CustomTextButton(
                      style: getLightStyle(
                          fontHeight: 1, color: ColorManager.hint2Grey),
                      text: '$likes Likes',
                      onPressed: () {}),
                  const Spacer(),
                  CustomTextButton(
                      style: getLightStyle(
                          fontHeight: 1, color: ColorManager.hint2Grey),
                      text: '$comments Comments',
                      onPressed: () {}),
                ],
              ),
            ),
            const CustomDivider(),
            ButtonsSection(
              likeOnTap: likeOnTap,
            ),
            const CustomDivider(),
            const CommentSection(),
          ],
        ),
      ),
    );
  }
}
