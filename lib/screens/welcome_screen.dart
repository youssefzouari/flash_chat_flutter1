import 'package:flash_chat_flutter1/screens/login_screen.dart';
import 'package:flash_chat_flutter1/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter1/components/Ourbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation =  ColorTween(begin: Colors.blue ,end: Colors.white).animate(controller);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [TypewriterAnimatedText('flash chat',textStyle: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,)
                  )],
                ),
              ],
            ),
            SizedBox(height: 48.0),
            ourbutton(color: Colors.lightBlueAccent,text: 'login',onpressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            ourbutton(color: Colors.blue,text: 'register',onpressed:() {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }, ),
          ],
        ),
      ),
    );
  }
}



