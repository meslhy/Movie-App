import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/ui/screens/main/main_screen.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  static const String roteName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, mainScreen.roteName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
      constraints: BoxConstraints.expand(),
        child: Center(
          child: Lottie.asset("assets/icons/moviesSplash.json"),
        ),
      ),
          backgroundColor :  AppColors.primary,
    );
  }
}
