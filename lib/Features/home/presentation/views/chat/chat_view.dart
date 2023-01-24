import 'package:flutter/material.dart';
import 'package:socialapp/Features/home/presentation/views/chat/widgets/chat_view_body.dart';
import 'package:socialapp/Features/home/presentation/views/chat/widgets/custom_row.dart';

import '../../../../../core/utils/function/navigation.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants.dart';

import '../../manger/app_cycle_cubit/app_cubit.dart';
import '../../manger/app_cycle_cubit/app_state.dart';
import '../widgets/custom_divider.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppGetUsersSuccessState) {
        //   postat.clear();
        // //  postatId.clear();
        //   postat.addAll(state.postModel!.cast<PostModel>());
        //   //postatId.addAll(state.postModel!.cast<PostModel>());
        //
        isLoading = true;

        // if (postat.isNotEmpty) {
        //   hasPosts = true;
        // }
      }
    }, builder: (context, state) {
      var model = AppCubit.get(context).userModel;
      if (isLoading = true) {
        return SingleChildScrollView(
          // controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding),
            child: Column(
              children: [
                // const CustomVerificationRow(),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            AppCubit.get(context).getMessage(
                              receiverId:
                                  AppCubit.get(context).users[index].uId!,
                            );
                            navigateToWithAnimation(
                                context,
                                ChatViewBody(
                                  image:
                                      AppCubit.get(context).users[index].image!,
                                  receiverId:
                                      AppCubit.get(context).users[index].uId!,
                                  name:
                                      AppCubit.get(context).users[index].name!,
                                ));
                          },
                          child: CustomChatRow(
                            name: AppCubit.get(context).users[index].name!,
                            profileImage:
                                AppCubit.get(context).users[index].image!,
                          ),
                        ),
                    separatorBuilder: (context, index) => const CustomDivider(),
                    itemCount: AppCubit.get(context).users.length),
              ],
            ),
          ),
        );
      }

      return CustomLoadingIndicator();
    });
  }
}
