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
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kPadding, horizontal: kPadding),
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
                      CustomNumbersColumn(text: sPosts(context), number: '122'),
                      CustomNumbersColumn(text: sPhotos(context), number: '110.5'),
                      CustomNumbersColumn(text: sFollowers(context), number: '5k'),
                      CustomNumbersColumn(text: sFollowing(context), number: '122'),
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
                          sAddPhoto(context),
                          style: getSemiStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s16),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: kMargin,
                    ),
                    Expanded(
                      child: CustomButton(
                        child: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                        onPressed: () {
                          navigateToWithAnimation(context, EdidProfilePage());
                        },
                      ),
                    ),
                  ]),
                ],
              ),
            );
          },
          fallback: (context) => const CustomLoadingIndicator(),
        );
      },
      listener: (context, state) {},
    );
  }
}
