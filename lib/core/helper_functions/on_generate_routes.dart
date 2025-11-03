import 'package:flutter/material.dart';
import 'package:fruit_ecommerce_app/feature/onBoarding/presentation/onBoarding.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView(),);
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(),);
  }
}