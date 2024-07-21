import 'package:flutter/material.dart';
import 'package:wirepay/home_view.dart';
import 'package:wirepay/sign_in_view.dart';
import 'package:wirepay/welcome_back_view.dart';

class AppRoutes {
  static const String homeView = '/homeView';
  static const String signIn = '/';
  static const String welcomeBack = '/onboarding';
}

class AppRouter {
  static const String initialRoute = AppRoutes.signIn;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signIn:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignInView(),
        );

      case AppRoutes.welcomeBack:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const WelcomeBackView(),
        );
      case AppRoutes.homeView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RouteNotFoundPage(),
        );
    }
  }
}

class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Route not found'),
      ),
    );
  }
}
