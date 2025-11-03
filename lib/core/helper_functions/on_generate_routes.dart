import 'package:flutter/material.dart';
import 'package:fruit_ecommerce_app/feature/splash/presentation/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView(),);
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(),);
  }
}