import 'package:flutter/material.dart';
import 'Signinpage.dart';
import 'Signuppage.dart';
import 'Homepage.dart';
import 'Donationpage.dart';
import 'Notificationpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Home',
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/signin': (context) => SignInScreen(),
        '/Home'  : (context) => Homepage(),
       // '/donation' : (context) => Donationpage(),
        '/notification' : (context) => Notificationpage(),
      },
    );
  }
}
