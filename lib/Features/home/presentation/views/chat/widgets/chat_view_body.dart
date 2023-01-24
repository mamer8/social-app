import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/language/strings.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../manger/app_cycle_cubit/app_cubit.dart';
import '../../../manger/app_cycle_cubit/app_state.dart';
import 'custom_chat_bubbles.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody(
      {Key? key,
      required this.name,
      required this.image,
      required this.receiverId})
      : super(key: key);
  final String name;
  final String image;
  final String receiverId;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      // if (state is AppCreatePostLoadingState) {
      //   showToast(state: ToastStates.loading, msg: 'Posting ...');
      // }
      // if (state is AppCreatePostSuccessState) {
      //   // navigateAndReplaceWithAnimation(context, const HomeView());
      //   showToast(state: ToastStates.success, msg: 'Posted successfully');
      // }
      // if (state is AppCreatePostErrorState) {
      //   showToast(state: ToastStates.error, msg: 'Post error ..}');
      // }
    }, builder: (context, state) {
      var model = AppCubit.get(context).userModel;

      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Hero(
                tag: 'image',
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    image,
                  ),
                ),
              ),
              const SizedBox(
                width: kMargin,
              ),
              Text(name),
            ],
          ),
        ),
        body: ConditionalBuilder(
          condition: true,
          builder: (context) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (AppCubit.get(context).messages.isEmpty)
                       Center(
                        child: Text(sMessageAppearance(context)),
                      ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => MessagesBubbles(
                              text: AppCubit.get(context).messages[index].text!,
                              itsme: AppCubit.get(context)
                                      .messages[index]
                                      .receiverId !=
                                  kUID),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 1,
                              ),
                          itemCount: AppCubit.get(context).messages.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kMargin, horizontal: kMargin),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: sTypeMessage(context),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      final now = DateTime.now().toString();

                                      AppCubit.get(context).sendMessage(
                                          text: textController.text,
                                          date: now,
                                          receiverId: receiverId);
                                      textController.clear();
                                    },
                                    icon: const Icon(Icons.send_rounded)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
