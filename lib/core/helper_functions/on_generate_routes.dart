import 'package:flutter/material.dart';
import 'package:fruit_ecommerce_app/feature/login/presentation/view/login_screen.dart';
import 'package:fruit_ecommerce_app/feature/onBoarding/presentation/onBoarding.dart';
import 'package:fruit_ecommerce_app/feature/splash/presentation/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView(),);
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView(),);
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen(),);
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(),);
  }
}