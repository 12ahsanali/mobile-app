import 'package:flutter/material.dart';
import 'package:lab3/screen/CircularAvatar.dart';
import 'package:lab3/screen/ListType.dart';
import 'package:lab3/screen/Sec_home.dart';
import './screen/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    
    );
  }
}
