import 'package:flutter/material.dart';
import '../ui/home.dart';
import '../ui/login.dart';
import '../ui/splash_screen.dart';
import '../ui/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case 'SplashScreen':
        return MaterialPageRoute(
            builder: (_) => const SplashScreen()
        );
      case 'Home':
        return MaterialPageRoute(builder: (_) => const Home());
      case 'Welcome_UI':
        return MaterialPageRoute(builder: (_) => const WelcomeUI());
      case 'Login':
        return MaterialPageRoute(builder: (_) => const Login());
      default:
        return _errorRoute();
    }

  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Invalid Route!!'),
            ),
          );
        }
    );
  }

}