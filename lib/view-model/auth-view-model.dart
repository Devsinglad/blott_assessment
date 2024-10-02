import 'package:blott_assessment/helpers/custom_widgets/loading_widget.dart';
import 'package:blott_assessment/helpers/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AuthModel {
  static Future<void> signUp({
    required BuildContext context,
    required String firstName,
    required String lastName,
  }) async {
    Load.show(context);
    try {
      await Future.delayed(const Duration(seconds: 2));

      /// Save data in repository
      Repository.getInstance()!.saveFirstName(firstName);
      Repository.getInstance()!.saveLastName(lastName);
      Repository.getInstance()!.setFirstTime();

      context.go('/setupNotificationScreen');
    } catch (e) {
      print('Error during sign-up: $e');
    } finally {
      Load.dismiss(context);
    }
  }
}
