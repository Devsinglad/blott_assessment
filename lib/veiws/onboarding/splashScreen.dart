import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/assets/blott-assets.dart';
import '../../helpers/repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Future<void> _checkTokenAndNavigate(BuildContext context) async {
    try {
      final repository = Repository.getInstance();
      if (repository!.getFirstTime() == 'true') {
        context.go('/homeScreen');
      } else {
        context.go('/signUpFormScreen');
      }
    } catch (e, s) {
      print('Error during navigation: $e');
      print('Error during navigation: $s');
    }
  }

  @override
  void initState() {
    _navigateAfterDelay();
    super.initState();
  }

  void _navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      _checkTokenAndNavigate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
            child: Center(
              child: SvgPicture.asset(
                BlottAsset.blotLogo,
              )
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slide(begin: const Offset(0, 1.0))
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slide(begin: const Offset(.1, 0.0))
                  .animate()
                  .fadeIn(duration: 900.ms)
                  .slideY(begin: .1, end: .0),
            ),
          ),
        ],
      ),
    );
  }
}
