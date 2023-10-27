import 'package:ektv/screens/authentication_screens/authentication_common_screen.dart';
import 'package:ektv/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ektv/services/constant_service.dart';

import '../services/common_action_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 Image? _image;
 @override
  void initState() {
    // TODO: implement initState
    _image=Image.asset("assets/images/cover.jpg",fit: BoxFit.fill,);
    Future.delayed(Duration(seconds: 4),(){
      CommonActions().navigateScreen(context,AuthCommonScreen());
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(_image!.image, context);
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kAppColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("EK TV",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: kWhiteColor),),
                  Text("Home for entertainment",style: TextStyle(fontSize: 16,color: kWhiteColor),)
                                            
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CircleAvatar(radius: 13,backgroundColor: kTransparentColor, child: CircularProgressIndicator(color: kWhiteColor,)),Text("   Loading...",style: TextStyle(fontWeight: FontWeight.bold,color: kWhiteColor),)
              ],),
            ),
          )
        ],
      ),
    
    );
  }
}

