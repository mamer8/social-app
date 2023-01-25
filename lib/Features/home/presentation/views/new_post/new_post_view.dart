import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Features/home/presentation/views/new_post/widgets/app_bar.dart';
import 'package:socialapp/Features/home/presentation/views/new_post/widgets/custom_float_action_button.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/cupertino_icons.dart';
import '../../../../../core/utils/function/navigation.dart';
import '../../../../../core/utils/function/show_toast.dart';
import '../../../../../core/utils/language/strings.dart';
import '../../../../../core/utils/styles/color_manager.dart';
import '../../../../../core/utils/styles/styles_manager.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../manger/app_cycle_cubit/app_cubit.dart';
import '../../manger/app_cycle_cubit/app_state.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppCreatePostLoadingState) {
        showToast(state: ToastStates.loading, msg: 'Posting ...');
      }
      if (state is AppCreatePostSuccessState) {
        // navigateAndReplaceWithAnimation(context, const HomeView());
        showToast(state: ToastStates.success, msg: 'Posted successfully');
      }
      if (state is AppCreatePostErrorState) {
        showToast(state: ToastStates.error, msg: 'Post error ..}');
      }
    }, builder: (context, state) {
      var model = AppCubit.get(context).userModel;
      var postImage = AppCubit.get(context).postImage;

      return Scaffold(
        appBar: buildAppBar(context, () {
          final now = DateTime.now().toString();
          if (textController.text.isNotEmpty) {
            if (AppCubit.get(context).postImage == null) {
              AppCubit.get(context)
                  .createPost(text: textController.text, date: now);
            } else {
              AppCubit.get(context)
                  .uploadPostImage(text: textController.text, date: now);
            }
            AppCubit.get(context).postImage = null;
            AppCubit.get(context).getPosts();
            Navigator.pop(context);
          } else {
            showToast(msg: 'Write something please', state: ToastStates.error);
          }
        }),
        floatingActionButton: const CustomFAB(),
        body: ConditionalBuilder(
          condition: true,
          builder: (context) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(kMargin),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                AssetsData.testImage,
                              ),
                            ),
                          ),
                          Expanded(
                            child:
                                CustomPostField(textController: textController),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: kMargin,
                      ),
                      if (postImage != null)
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image(
                              image: FileImage(postImage),
                              // fit: BoxFit.cover,
                              height: 500,
                              // width: double.maxFinite,
                            ),
                            IconButton(
                              onPressed: () {
                                AppCubit.get(context).postImage = null;
                              },
                              icon: const Icon(kXMarkIcon),
                              iconSize: 30,
                              color: ColorManager.primary,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
          fallback: (context) => const CustomLoadingIndicator(),
        ),
      );
    });
  }
}

class CustomPostField extends StatelessWidget {
  const CustomPostField({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.text,
        controller: textController,
        maxLines: 9,
        minLines: 1,
        decoration: InputDecoration(
            hintText: sWhatInMind(context),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none),
        autofocus: true,
        style: getRegularStyle(
            fontSize: 20, color: ColorManager.black, fontHeight: 1.2));
  }
}
