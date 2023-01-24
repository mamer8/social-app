import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/cupertino_icons.dart';
import '../../../../../core/utils/function/navigation.dart';
import '../../../../../core/utils/styles/color_manager.dart';
import '../../../../../core/utils/styles/styles_manager.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../data/models/post_model.dart';
import '../../manger/app_cycle_cubit/app_cubit.dart';
import '../../manger/app_cycle_cubit/app_state.dart';
import '../new_post/new_post_view.dart';
import '../widgets/action_buttons.dart';
import '../widgets/card.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_verify_Row.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({Key? key}) : super(key: key);
  bool isLoading = false;
  bool hasPosts = false;
  List<PostModel> postat = [];
  //List<String> postatId = [];
  Future<void> _onRefresh(BuildContext context) async {
    AppCubit.get(context).getPosts();
  }

  // ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToWithAnimation(context, const NewPostView());
          },
          child: const Icon(kAddPostIcon)),
      body: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is AppGetPostsSuccessState) {
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
          return RefreshIndicator(
            onRefresh: () async {
              AppCubit.get(context).getPosts();
            },
            child: SingleChildScrollView(
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
                        itemBuilder: (context, index) => PostWidget(
                            likeOnTap: () {
                              AppCubit.get(context).likePost(
                                  AppCubit.get(context).postsId[index]);
                              print(
                                  'post liked ssssssssssssssssssssssssssssssssssssss');
                            },
                            name: AppCubit.get(context).posts[index].name!,
                            profileImage:
                                AppCubit.get(context).posts[index].image!,
                            date: AppCubit.get(context).posts[index].date!,
                            text: AppCubit.get(context).posts[index].text!,
                            comments: 10,
                            likes: AppCubit.get(context).likes.isNotEmpty
                                ? AppCubit.get(context).likes[index]
                                : 0,
                            postImage:
                                AppCubit.get(context).posts[index].postImage!),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: kPadding,
                            ),
                        itemCount: AppCubit.get(context).posts.length),
                  ],
                ),
              ),
            ),
          );
        }

        return CustomLoadingIndicator();
      }),
    );
  }
}
