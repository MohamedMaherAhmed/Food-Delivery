import 'package:flutter/material.dart';
import 'package:food_delivery/utils/global_vars.dart' as global;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// here you check for loggedIn bool SharedPreference value
  /// as well as firstTimeDone bool SharedPreference value
  /// if both are true Navigate to Home UI directly from SplashScreen
  /// if not Navigate to the Welcome UI > login UI > 3 useless UIs > Home UI
  /// then set the value of the both booleans to true
  @override
  void initState() {
    super.initState();
    check();
  }

  Future<void> check() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () async {
        if (global.prefs?.getBool('loggedIn') == true &&
            global.prefs?.getBool('first_time_done') == true) {
          global.postData();
          global.dynamicDelay(sec: 10, milliSec: 500);
          Navigator.pushNamedAndRemoveUntil(context, 'Home', (route) => false);
        } else {
          global.dynamicDelay(sec: 5, milliSec: 500);
          Navigator.pushNamed(context, 'Welcome_UI');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.colorMap['Orange_Color'],
        elevation: 0,
      ),
      body: Container(
        color: global.colorMap['Orange_Color'],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 93,
                      height: 93,
                      decoration: BoxDecoration(
                        color: global.colorMap['Anything_White'],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Image.asset(
                        'assets/splash_screen_logo.png',
                        scale: 2,
                        width: 55.85,
                        height: 57.63,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/splash_screen_logo_title.png',
                      width: 182,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 100),
              child: CircularProgressIndicator(
                color: global.colorMap['Anything_White'],
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
