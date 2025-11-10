import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_ecommerce_app/feature/onBoarding/presentation/onBoarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushNamedAndRemoveUntil(
        context,
        OnBoardingView.routeName,
        (route) => false,),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Onboarding.png'),
            fit: BoxFit.cover, // or BoxFit.fill, BoxFit.contain, etc.
          ),
        ),
        child: Center(
          child: Image.asset('assets/splash.png', width: MediaQuery
              .of(context)
              .size
              .width, height: MediaQuery
              .of(context)
              .size
              .height,),
        ),
      ),
    );
  }
}
