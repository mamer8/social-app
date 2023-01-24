import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../utils/cupertino_icons.dart';
import '../utils/styles/styles_manager.dart';
import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/values_manager.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isMessage;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  //FocusNode myFocusNode = FocusNode();
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.prefixIcon,
      this.validator,
      this.suffixIcon,
      this.keyboardType = TextInputType.text,
      this.isMessage = false,
      this.controller,
      this.initialValue,
      this.onChanged,
      this.onTap,
      this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSize.s5),
      child: TextFormField(
          controller: widget.controller,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          initialValue: widget.initialValue,
          obscureText: widget.isPassword ?? false,
          maxLines: widget.isMessage ? 5 : 1,
          minLines: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.BGwhite,
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          )),
    );
  }
}

//
class CustomTextFieldPassword extends StatefulWidget {
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextFieldPassword(
      {super.key,
      required this.labelText,
      this.prefixIcon,
      this.validator,
      this.suffixIcon,
      this.keyboardType = TextInputType.visiblePassword,
      this.controller,
      this.initialValue,
      this.onChanged,
      this.onTap,
      this.isPassword = true});

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool showpasscurrent = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSize.s5),
      child: TextFormField(
          controller: widget.controller,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          initialValue: widget.initialValue,
          obscureText: showpasscurrent,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.BGwhite,
            labelText: widget.labelText,
            prefixIcon: Padding(
              padding: EdgeInsets.all(AppSize.s10),
              child: const Icon(kLockIcon),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s8),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    showpasscurrent = !showpasscurrent;
                  });
                },
                icon: showpasscurrent
                    ? const Icon(kEyeOnIcon)
                    : const Icon(kEyeOffIcon),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s0),
            ),
          )),
    );
  }
}
