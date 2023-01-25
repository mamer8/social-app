import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/function/navigation.dart';
import '../../../../../../core/utils/language/strings.dart';
import '../../../../../../core/utils/styles/color_manager.dart';
import '../../../../../../core/utils/styles/font_manager.dart';
import '../../../../../../core/utils/styles/styles_manager.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../manger/app_cycle_cubit/app_cubit.dart';
import '../../../manger/app_cycle_cubit/app_state.dart';
import '../../new_post/new_post_view.dart';
import '../../widgets/card.dart';
import 'custom_button.dart';
import 'custom_number_column.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_profle.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var model = AppCubit.get(context).userModel;
        var profileImage = AppCubit.get(context).profileImage;
        return ConditionalBuilder(
          condition: model != null,
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: kPadding,
                    right: kPadding,
                    top: kPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: model.image != null
                                ? profileImage != null
                                    ? Image(
                                        image: FileImage(profileImage),
                                        fit: BoxFit.cover,
                                        height: 150,
                                        width: 150,
                                      )
                                    : Image(
                                        image: NetworkImage(model.image!),
                                        height: 130,
                                        width: 130,
                                        fit: BoxFit.cover,
                                      )
                                : Container(
                                    child: null,
                                  )),
                      ),
                      const SizedBox(
                        height: kMargin,
                      ),
                      Text(
                        '${model.name}',
                        style: getBoldStyle(fontSize: FontSize.s20),
                      ),
                      const SizedBox(
                        height: kMargin,
                      ),
                      Text(
                        model.bio == null ? '' : '${model.bio}',
                        style: getRegularStyle(),
                      ),
                      const SizedBox(
                        height: kPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomNumbersColumn(
                              text: sPosts(context), number: '122'),
                          CustomNumbersColumn(
                              text: sPhotos(context), number: '110.5'),
                          CustomNumbersColumn(
                              text: sFollowers(context), number: '5k'),
                          CustomNumbersColumn(
                              text: sFollowing(context), number: '122'),
                        ],
                      ),
                      const SizedBox(
                        height: kPadding,
                      ),
                      Row(children: [
                        Expanded(
                          flex: 3,
                          child: CustomButton(
                            child: Text(
                              sAddPost(context),
                              style: getSemiStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s16),
                            ),
                            onPressed: () {
                              navigateToWithAnimation(
                                  context, const NewPostView());
                            },
                          ),
                        ),
                        const SizedBox(
                          width: kMargin,
                        ),
                        Expanded(
                          child: CustomButton(
                            child:
                                Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                            onPressed: () {
                              navigateToWithAnimation(
                                  context, EdidProfilePage());
                            },
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  // controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPadding),
                    child: Column(
                      children: [
                        // const CustomVerificationRow(),
                        ListView.separated(
                            shrinkWrap: true,
                            reverse: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => AppCubit.get(
                                            context)
                                        .posts[index]
                                        .name ==
                                    model.name
                                ? PostWidget(
                                    likeOnTap: () {
                                      AppCubit.get(context).likePost(
                                          AppCubit.get(context).postsId[index]);
                                      print(
                                          'post liked ssssssssssssssssssssssssssssssssssssss');
                                    },
                                    name: AppCubit.get(context)
                                        .posts[index]
                                        .name!,
                                    profileImage: AppCubit.get(context)
                                        .posts[index]
                                        .image!,
                                    date: AppCubit.get(context)
                                        .posts[index]
                                        .date!,
                                    text: AppCubit.get(context)
                                        .posts[index]
                                        .text!,
                                    comments: 10,
                                    likes:
                                        AppCubit.get(context).likes.isNotEmpty
                                            ? AppCubit.get(context).likes[index]
                                            : 0,
                                    postImage: AppCubit.get(context)
                                        .posts[index]
                                        .postImage!)
                                : SizedBox(
                                    height: .10,
                                  ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: kPadding,
                                ),
                            itemCount: AppCubit.get(context).posts.length),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          fallback: (context) => const CustomLoadingIndicator(),
        );
      },
      listener: (context, state) {},
    );
  }
}
