import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Features/home/presentation/views/home_view.dart';
import 'package:socialapp/core/utils/function/navigation.dart';

import '../../../../../core/utils/constants.dart';

import '../../../../../core/utils/cupertino_icons.dart';
import '../../../../../core/utils/function/show_toast.dart';
import '../../../../../core/utils/language/strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_language_icon.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manger/login_cubit/login_cubit.dart';
import '../../manger/login_cubit/login_state.dart';
import '../login_view.dart';
import 'custom_row_text.dart';
import 'custom_text.dart';
import 'logo_image.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.getobject(context);

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          showToast(state: ToastStates.loading, msg: 'Sending data ...');
        }
        if (state is CreateUserSuccessState) {
          showToast(state: ToastStates.success, msg: 'Registered successfully');
          navigateTo(context, const LoginView());
        }

        if (state is RegisterErrorState) {
          showToast(state: ToastStates.error, msg: 'Register error }');
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
                    customText(text: sRegister(context)),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: nameController,
                      labelText: sName(context),
                      prefixIcon: const Icon(kNameIcon),
                      validator: (value) =>
                          value!.isEmpty ? 'Name cannot be blank' : null,
                    ),
                    const SizedBox(
                      height: 10,
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
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      labelText: sPhone(context),
                      prefixIcon: const Icon(kPhoneIcon),
                      validator: (value) =>
                          value!.isEmpty ? 'phone cannot be blank' : null,
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
                        condition: state is! CreateUserLoadingState,
                        builder: (context) => CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    name: nameController.text,
                                    password: passwordController.text);

                                print('Form is valid');
                              } else {
                                print('Form is Not valid');
                              }
                            },
                            text: sRegister(context)),
                        fallback: (context) => const CustomLoadingIndicator()),
                    const TextRow(
                      login1_register2: 2,
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
