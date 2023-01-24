import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/function/show_toast.dart';
import '../../../../../core/utils/styles/styles_manager.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../manger/app_cycle_cubit/app_cubit.dart';

class CustomVerificationRow extends StatelessWidget {
  const CustomVerificationRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = AppCubit.get(context).userModel;

    if (!model.isEmailVerified!) {
      return Container(
        color: Colors.amberAccent.withOpacity(.8),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Row(
            children: [
              Text(
                'Please verify your Email !',
                style: getRegularStyle(),
              ),
              const Spacer(),
              CustomTextButton(
                  text: 'SEND',
                  onPressed: () {
                    FirebaseAuth.instance.currentUser!
                        .sendEmailVerification()
                        .then((value) {
                      model.isEmailVerified = true;
                      showToast(
                          state: ToastStates.success, msg: 'Check your mail');
                    }).catchError((e) {
                      showToast(
                          msg: '${e.toString()} error ',
                          state: ToastStates.error);
                    });
                  }),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: null,
      );
    }
  }
}
