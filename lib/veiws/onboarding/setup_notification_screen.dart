import 'package:blott_assessment/helpers/constants.dart';
import 'package:blott_assessment/helpers/custom_widgets/customSIzedBox.dart';
import 'package:blott_assessment/helpers/custom_widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/assets/blott-assets.dart';
import '../../helpers/notification-service.dart';

class SetupNotificationScreen extends StatelessWidget {
  const SetupNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      BlottAsset.blotMessageIcon,
                    ),
                    Spacing(24.h),
                    Text(
                      'Get the most out of Blott ✅',
                      style: AppConstants.myStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    Spacing(16.h),
                    Text(
                      'Allow notifications to stay in the loop with\n your payments, requests and groups.',
                      style: AppConstants.myStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color(0xff737373),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              CustomAppButton(
                btnSizeH: 55,
                btnSizeW: double.maxFinite,
                borderRadius: 24,
                isActive: true,
                title: 'Continue',
                fontSize: 16,
                onPressed: () {
                  NotificationService.promptNotification(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
