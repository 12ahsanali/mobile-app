import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("This is my Lab1 Task of Mobile Application Development"),
          
        ),
        body: Center(
          child: Text(
            "Hello Flutter from Lab1",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
      ),
    );
  }
}

