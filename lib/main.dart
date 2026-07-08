import 'package:flutter/material.dart';
import 'package:flash_chat_flutter1/screens/chat_screen.dart';
import 'package:flash_chat_flutter1/screens/login_screen.dart';
import 'package:flash_chat_flutter1/screens/registration_screen.dart';
import 'package:flash_chat_flutter1/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Waits for Flutter to be ready
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Connects to iOS/Android/Web
  );
  runApp(FlashChat());
}


class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id ,
      routes: {
        WelcomeScreen.id :   (context) => WelcomeScreen(),
        RegistrationScreen.id:  (context) => RegistrationScreen(),
        LoginScreen.id :  (context) => LoginScreen(),
        ChatScreen.id :  (context) => ChatScreen(),
      },
    );
  }
}
