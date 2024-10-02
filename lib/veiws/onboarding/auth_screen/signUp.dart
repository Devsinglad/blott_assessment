import 'package:blott_assessment/helpers/assets/color.dart';
import 'package:blott_assessment/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/custom_widgets/customSIzedBox.dart';
import '../../../helpers/custom_widgets/custom_text_field.dart';
import '../../../view-model/auth-view-model.dart';

class SignUpFormScreen extends StatefulWidget {
  const SignUpFormScreen({super.key});

  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  String lastName = '';
  String firstName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your legal name',
                style: AppConstants.myStyle.copyWith(
                  fontSize: 30.h,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              Text(
                'We need to know a bit about you so that we can create your account.',
                style: AppConstants.myStyle.copyWith(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: const Color(0xff737373),
                ),
              ),
              Spacing(30.h),
              CustomTextFormField(
                hintText: 'First name',
                validator: (value) {
                  return AppConstants.validateField(firstName); // corrected
                },
                onchange: (value) {
                  setState(() {
                    firstName = value!;
                  });
                },
              ),
              Spacing(30.h),
              CustomTextFormField(
                hintText: 'Last Name',
                action: TextInputAction.done,
                validator: (value) {
                  return AppConstants.validateField(lastName); // corrected
                },
                onchange: (value) {
                  setState(() {
                    lastName = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          onPressed: firstName.isEmpty && lastName.isEmpty
              ? () {}
              : () {
                  AuthModel.signUp(
                      context: context,
                      firstName: firstName,
                      lastName: lastName);
                },
          shape: const CircleBorder(),
          backgroundColor: firstName.isEmpty && lastName.isEmpty
              ? primaryButtonColor.withOpacity(0.4)
              : primaryButtonColor,
          child: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slide(begin: const Offset(0, 1.0))
        .animate()
        .fadeIn(duration: 600.ms)
        .slide(begin: const Offset(.1, 0.0))
        .animate()
        .fadeIn(duration: 900.ms)
        .slideY(begin: .1, end: .0);
  }
}
