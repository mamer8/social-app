import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/core/utils/function/navigation.dart';

import '../../../../../core/utils/constants.dart';

import '../../../../../core/utils/cupertino_icons.dart';
import '../../../../../core/utils/function/show_toast.dart';
import '../../../../../core/utils/language/strings.dart';
import '../../../../../core/utils/network/local/cache_helper.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_language_icon.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../home/presentation/manger/app_cycle_cubit/app_cubit.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../manger/login_cubit/login_cubit.dart';
import '../../manger/login_cubit/login_state.dart';
import 'custom_row_text.dart';
import 'custom_text.dart';
import 'logo_image.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({Key? key}) : super(key: key);
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.getobject(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showToast(state: ToastStates.loading, msg: 'Sending data ...');
        }
        if (state is LoginSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId);
          kUID = CacheHelper.getData(key: 'uId');
          AppCubit.get(context).getUserData();
          navigateAndReplaceWithAnimation(context, const HomeView());
          showToast(state: ToastStates.success, msg: 'Login successful');
        }
        if (state is LoginErrorState) {
          showToast(
              state: ToastStates.error,
              msg: 'Login error .. ${state.error.toString()}');
        }
      },
      builder: (context, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ChangeLanguageIcon(),
                    const Logo(),
                    const SizedBox(
                      height: 4,
                    ),
                    customText(text: sLogin(context)),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      labelText: sEmail(context),
                      prefixIcon: const Icon(kMailIcon),
                      validator: (value) =>
                          value!.isEmpty ? 'Email cannot be blank' : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldPassword(
                      controller: passwordController,
                      labelText: sPassword(context),
                      validator: (value) =>
                          value!.isEmpty ? 'Password cannot be blank' : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                                print('Form is valid');
                              } else {
                                print('Form is Not valid');
                              }
                            },
                            text: sLogin(context)),
                        fallback: (context) => const CustomLoadingIndicator()),
                    const TextRow(
                      login1_register2: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
