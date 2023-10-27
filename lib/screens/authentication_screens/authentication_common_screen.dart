import 'package:ektv/screens/authentication_screens/password_change_screen.dart';
import 'package:ektv/screens/authentication_screens/signin_screen.dart';
import 'package:ektv/screens/authentication_screens/signup_screen.dart';
import 'package:ektv/services/constant_service.dart';
import 'package:flutter/material.dart';

class AuthCommonScreen extends StatefulWidget {
  const AuthCommonScreen({super.key});

  @override
  State<AuthCommonScreen> createState() => _AuthCommonScreenState();
}

final pageController=PageController(initialPage: 0);

class _AuthCommonScreenState extends State<AuthCommonScreen> {
  
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;  
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width:screenSize.width,
            height: screenSize.height,
            child: Image.asset("assets/images/cover.jpg",fit: BoxFit.fill,),),
            SafeArea(
            child:PageView(
              controller: pageController,
              children: [
                SigninScreen(),
                SignupScreen(),
                PasswordChangeScreen()
            
              ],
            ) ),
        ],
      ),
    );
  }
}

