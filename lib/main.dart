import 'package:flutter/material.dart';
import 'package:fruit_ecommerce_app/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_ecommerce_app/feature/onBoarding/presentation/onBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frutella',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: OnBoardingView.routeName,
    );
  }
}