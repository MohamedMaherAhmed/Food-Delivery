import 'package:flutter/material.dart';
import '../ui/home.dart';
import '../ui/first_time_ui/login.dart';
import '../ui/splash_screen.dart';
import '../ui/first_time_ui/welcome.dart';
import '../ui/first_time_ui/register.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'SplashScreen':
        return PageTransition(
            child: const SplashScreen(),
            duration: const Duration(seconds: 1),
            type: PageTransitionType.fade);
      case 'Home':
        return PageTransition(
            child: const Home(), type: PageTransitionType.fade);
      case 'Welcome':
        return PageTransition(
            child: const WelcomeUI(),
            duration: const Duration(seconds: 1),
            type: PageTransitionType.fade);
      case 'Register':
        return PageTransition(
            child: const Register(), type: PageTransitionType.fade);
      case 'Login':
        return PageTransition(
            child: const Login(), type: PageTransitionType.fade);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid Route!!'),
        ),
      );
    });
  }
}
