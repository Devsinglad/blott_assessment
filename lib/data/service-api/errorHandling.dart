import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void handleDioError(Object e, BuildContext context, {String? errMsg}) {
  if (e is DioException) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      customPopUp(
          context,
          'Network is unreachable! Please, check your internet connection and try again.',
          "warning");
    } else {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        print('${e.response?.data['data']['msg']}');
        customPopUp(context, '${e.response?.data['data']['msg']}', "warning");
      } else if (e.response?.data["msg"].contains("invalid auth token")) {
        customPopUp(
            context, 'Session has expired, please log in again', "warning");
        GoRouter.of(context).go('/login_screen'); // Navigate to login screen
      } else {
        customPopUp(
          context,
          errMsg ?? '${e.response?.data["msg"] ?? "An error occurred"}',
          "warning",
        );
      }
    }
  } else {
    /// Handle any other type of exception
    customPopUp(
        context, 'An unexpected error occurred. Please try again.', "error");
  }
}

void customPopUp(BuildContext context, String message, String type) {
  final overlay = Overlay.of(context);
  final snackBar = Positioned(
    top: MediaQuery.of(context).padding.top +
        10.0, // Add some padding from the top
    left: 10.0,
    right: 10.0,
    child: Material(
      elevation: 6.0,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: type == "warning"
              ? const Color(0xFFF3EEF7)
              : const Color(0xffFFF5F5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: type == "warning"
                ? const Color(0xff66191D)
                : const Color(0xFF40711B),
          ),
        ),
      ),
    ),
  );

  // Create an OverlayEntry
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => snackBar,
  );

  // Insert the overlay entry into the overlay
  overlay.insert(overlayEntry);

  // Remove the overlay entry after a duration
  Future.delayed(Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
