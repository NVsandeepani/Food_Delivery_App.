import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50], 
        primaryColor: Colors.deepOrangeAccent, 
          ),
      home: HomeSreen() 
    );
  }
}
