import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets/color.dart';
import '../constants.dart';

class CustomAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final bool isActive;
  final double fontSize;
  final double? btnSizeW;
  final double? btnSizeH;
  final BoxShape? boxShape;

  const CustomAppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color, // Default button color
    this.textColor = Colors.white, // Default text color
    this.borderRadius = 8.0, // Default border radius
    this.padding = 0.0, // Default padding
    this.isActive = true, // Control button state
    this.fontSize = 16.0,
    this.btnSizeW, // Default button width
    this.btnSizeH,
    this.boxShape, // Default button height
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? SizedBox(
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                height: btnSizeH,
                width: btnSizeW ?? double.maxFinite,
                decoration: BoxDecoration(
                  color: color ?? primaryButtonColor,
                  shape: boxShape ?? BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: AppConstants.myStyle.copyWith(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: null,
            child: Container(
              height: btnSizeH ?? 56.h,
              width: btnSizeW ?? double.maxFinite,
              decoration: BoxDecoration(
                color: color?.withOpacity(0.2) ??
                    primaryButtonColor.withOpacity(0.2),
                shape: boxShape ?? BoxShape.rectangle,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: Text(
                  title,
                  style: AppConstants.myStyle.copyWith(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
  }
}
