import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/language/strings.dart';
import '../../../manger/app_cycle_cubit/app_cubit.dart';
import '../../../manger/app_cycle_cubit/app_state.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/cupertino_icons.dart';
import '../../../../../../core/utils/styles/color_manager.dart';
import '../../../../../../core/utils/styles/font_manager.dart';
import '../../../../../../core/utils/styles/styles_manager.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

//enum ImageSourceType { gallery, camera }

class EdidProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final bioController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = AppCubit.get(context).userModel;
          var profileImage = AppCubit.get(context).profileImage;
          nameController.text = model.name!;
          bioController.text = model.bio!;
          phoneController.text = model.phone!;

          return Scaffold(
            appBar: AppBar(
              title: Text(sEditProfile(context)),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            body: ConditionalBuilder(
              condition: state is! AppLoadingState,
              builder: (context) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPadding),
                      child: Column(
                        children: [
                          if (state is AppUpdateUserLoadingState)
                            const LinearProgressIndicator(),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kPadding),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorManager.primary,
                                                width: 3),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: profileImage != null
                                              ? Image(
                                                  image:
                                                      FileImage(profileImage),
                                                  fit: BoxFit.cover,
                                                  height: 150,
                                                  width: 150,
                                                )
                                              : Image(
                                                  image: NetworkImage(
                                                      model.image!),
                                                  fit: BoxFit.cover,
                                                  height: 150,
                                                  width: 150,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2),
                                    child: CircleAvatar(
                                      backgroundColor: ColorManager.primary,
                                      child: IconButton(
                                        icon: Icon(kCameraIcon,
                                            color: ColorManager.white),
                                        onPressed: () {
                                          AppCubit.get(context)
                                              .getProfileImage();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            labelText: sName(context),
                            prefixIcon: const Icon(kNameIcon),
                            validator: (value) =>
                                value!.isEmpty ? 'Name cannot be blank' : null,
                          ),
                          const SizedBox(
                            height: kMargin,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.text,
                            controller: bioController,
                            labelText: sBio(context),
                            prefixIcon: const Icon(kBioIcon),
                            validator: (value) =>
                                value!.isEmpty ? 'Name cannot be blank' : null,
                          ),
                          const SizedBox(
                            height: kMargin,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            labelText: sPhone(context),
                            prefixIcon: const Icon(kPhoneIcon),
                            validator: (value) =>
                                value!.isEmpty ? 'Name cannot be blank' : null,
                          ),
                          const SizedBox(
                            height: kMargin,
                          ),
                          CustomButton(
                              text: sSave(context),
                              onPressed: () {
                                if (profileImage != null) {
                                  AppCubit.get(context).uploadImage(
                                      phone: phoneController.text,
                                      name: nameController.text,
                                      bio: bioController.text);
                                } else {
                                  AppCubit.get(context).updateUser(
                                      phone: phoneController.text,
                                      name: nameController.text,
                                      bio: bioController.text);
                                }
                              }),
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
