import 'package:blott_assessment/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onchange;
  final Function()? onTap;
  final bool? readOnly;
  final TextInputAction? action;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? isMobile;
  const CustomTextFormField({
    super.key,
    this.labelText,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onchange,
    this.onTap,
    this.readOnly = false,
    this.action = TextInputAction.next,
    this.controller,
    this.icon,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: isPassword,
          keyboardType: keyboardType,
          onChanged: onchange,
          onTap: onTap,
          textInputAction: action,
          controller: controller,
          readOnly: readOnly!,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: AppConstants.myStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xffD4D4D4),
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: Color(0xffD4D4D4)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
            ),
            enabled: true,
            errorStyle: const TextStyle(height: 0.5, fontSize: 8),
            errorMaxLines: 2,
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: Color(0xffD4D4D4)),
            ),
            suffixIcon: icon,
          ),
          validator: validator,
          enabled: true,
        ),
      ],
    );
  }
}
