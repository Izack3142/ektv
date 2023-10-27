import 'package:ektv/screens/authentication_screens/authentication_common_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class CommonActions{

  void animatePageView(int newPage){
    pageController.animateToPage(newPage, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void showToast(String message){
    Fluttertoast.showToast(msg: message);
  }

  void navigateScreen(BuildContext context,Widget child, {bool? replace}){
     if(replace==true){
       Navigator.pushReplacement(context, PageTransition(child: child, type: PageTransitionType.rightToLeft));
     }else{
      Navigator.push(context, PageTransition(child: child, type: PageTransitionType.rightToLeft));
     }
  }
}