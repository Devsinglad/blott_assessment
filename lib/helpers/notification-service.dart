import 'package:blott_assessment/data/service-api/errorHandling.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static promptNotification(BuildContext context) async {
    PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      customPopUp(context, 'Notification permission granted', '');
      context.go('/homeScreen');
    } else if (status.isDenied) {
      customPopUp(context, 'Notification permission denied', 'warning');
      context.go('/homeScreen');
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
