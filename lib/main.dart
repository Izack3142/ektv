import 'package:ektv/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ektv/screens/home_screen.dart';


void main() {
  runApp(const EKTVApp());
}

final scaffoldKey=GlobalKey<ScaffoldMessengerState>();

class EKTVApp extends StatelessWidget {
  const EKTVApp({super.key});

  @override
  Widget build(BuildContext context){
  const MaterialColor colorPrimarySwatch = const MaterialColor(
    0xFF003151,
    const <int, Color>{
      50: const Color(0xFF003151),
      100: const Color(0xFF003151),
      200: const Color(0xFF003151),
      300: const Color(0xFF003151),
      400: const Color(0xFF003151),
      500: const Color(0xFF003151),
      600: const Color(0xFF003151),
      700: const Color(0xFF003151),
      800: const Color(0xFF003151),
      900: const Color(0xFF003151),
    },
     );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldKey,
      theme: ThemeData(
        primarySwatch: colorPrimarySwatch
      ),
      home:SplashScreen()
    );
  }
}