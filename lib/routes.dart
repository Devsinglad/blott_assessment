import 'package:blott_assessment/veiws/dashBoard/home.dart';
import 'package:blott_assessment/veiws/onboarding/auth_screen/signUp.dart';
import 'package:blott_assessment/veiws/onboarding/setup_notification_screen.dart';
import 'package:blott_assessment/veiws/onboarding/splashScreen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/signUpFormScreen',
        builder: (context, state) => const SignUpFormScreen(),
      ),
      GoRoute(
        path: '/setupNotificationScreen',
        builder: (context, state) => const SetupNotificationScreen(),
      ),
      GoRoute(
        path: '/homeScreen',
        builder: (context, state) => HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => const SplashScreen(), // Fallback for 404
  );
}
