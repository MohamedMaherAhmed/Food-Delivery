import 'package:flutter/material.dart';
import 'package:food_delivery/utils/global_vars.dart' as global;

class WelcomeUI extends StatefulWidget {
  const WelcomeUI({Key? key}) : super(key: key);

  @override
  State<WelcomeUI> createState() => _WelcomeUIState();
}

class _WelcomeUIState extends State<WelcomeUI> {
  @override
  void initState() {
    super.initState();
    global.firstTimeDoneCounter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/welcome_background.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: AlignmentDirectional.center,
              repeat: ImageRepeat.noRepeat,
            ),
            Positioned(
              left: 30,
              top: 181,
              child: RichText(
                text: TextSpan(
                  text: 'Welcome ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: global.colorMap['Black_With_Font_Weight_700'],
                    fontFamily: "Sofia Pro",
                    fontSize: 53,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'to ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: global.colorMap['Black_With_Font_Weight_700'],
                          fontFamily: "Sofia Pro",
                          fontSize: 45,
                        )),
                    TextSpan(
                        text: '\nFoodHub',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: global.colorMap['Orange_Color'],
                          fontFamily: "Sofia Pro",
                          fontSize: 54,
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.center,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.transparent,
                      global.colorMap[
                          'Welcome_UI_Bottom_Part_Gradient_Coloring_First_Color'],
                      global.colorMap[
                          'Welcome_UI_Bottom_Part_Gradient_Coloring_Second_Color'],
                    ],
                        stops: const [
                      0.0,
                      0.2,
                      1.0,
                      1.1
                    ])),
              ),
            ),
            Positioned(left: 292.5, top: 29,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: global.colorMap['Anything_White'],
                    fixedSize: const Size(52, 32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27.41)),
                  ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: global.colorMap['Orange_Color'],
                    fontFamily: "Sofia Pro",
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 311,
              child: Text(
                'Your favourite foods delivered\nfast at your door.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: global.colorMap['Welcome_UI_Small_Body_Paragraphs'],
                  fontFamily: "Sofia Pro",
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              top: 557,
              left: 44,
              child: SizedBox(
                width: 84,
                height: 0,
                child: Divider(
                  height: 0,
                  color: global.colorMap['Anything_White'],
                  thickness: 0.5,
                ),
              ),
            ),
            Positioned(
              left: 150,
              top: 552,
              child: Text(
                'Sign in with',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: global.colorMap['Anything_White'],
                  fontFamily: "Sofia Pro",
                  fontSize: 14,
                ),
              ),
            ),
            Positioned(
              left: 248,
              top: 557,
              child: SizedBox(
                width: 89,
                height: 0,
                child: Divider(
                  height: 0,
                  color: global.colorMap['Anything_White'],
                  thickness: 0.5,
                ),
              ),
            ),
            Positioned(
              left: 44,
              top: 585,
              child: ElevatedButton.icon(
                icon: Icon(Icons.facebook,
                    color: global
                        .colorMap['Welcome_UI_FB_Button_Icon_BackGround_Color']),
                label: Text(
                  'FACEBOOK',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: global.colorMap['Anything_Black'],
                    fontFamily: "Sofia Pro",
                    fontSize: 13,
                  ),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: global.colorMap['Anything_White'],
                  fixedSize: const Size(139.26, 54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.41)),
                  elevation: 3,
                ),
              ),
            ),
            Positioned(
              left: 198,
              top: 585,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: global.colorMap['Anything_White'],
                  fixedSize: const Size(139.26, 54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.41)),
                  elevation: 3,
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/google_login_button_icon_image.png',
                        scale: 2),
                    const SizedBox(width: 15),
                    Text(
                      'GOOGLE',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: global.colorMap['Anything_Black'],
                        fontFamily: "Sofia Pro",
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 42,
              top: 662,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: global.colorMap['Anything_White'].withOpacity(0.3),
                  fixedSize: const Size(293, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                        color: global.colorMap['Anything_White'], width: 2),
                  ),
                ),
                child: Text(
                  'Start with email or phone',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: global
                        .colorMap['Welcome_UI_Email_Login_Button_Text_Color'],
                    fontFamily: "Sofia Pro",
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 79,
              top: 744,
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account ?  ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: global.colorMap['Anything_White'],
                    fontFamily: "Sofia Pro",
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: global.colorMap['Anything_White'],
                          fontFamily: "Sofia Pro",
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
