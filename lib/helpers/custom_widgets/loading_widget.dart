import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../assets/color.dart';

class Load {
  static void show(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (BuildContext context) => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ));
  }

  static void showWithMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (BuildContext context) => Center(
              child: Container(
                width: 250.0,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0)),
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SpinKitFadingCircle(
                        color: primaryColor,
                        size: 50,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration:
                              TextDecoration.none, // Ensure no underline
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  static void dismiss(BuildContext context) {
    if (context != null && Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static Widget loadingWidget({double? width, double? height, Color? color}) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4.0)),
      child: const Center(
        child: SpinKitFadingCircle(color: primaryColor),
      ),
    );
  }

  static Widget onlySpinKitFadingCircle({double? width, double? height}) {
    return const Center(
      child: SpinKitFadingCircle(color: primaryColor),
    );
  }
}
