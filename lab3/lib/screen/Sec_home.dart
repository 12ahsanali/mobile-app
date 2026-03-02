import 'package:flutter/material.dart';

class SecHome extends StatelessWidget {
  const SecHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Margin & Padding Task"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 10.0,
          ).add(
            const EdgeInsets.only(left: 10),
          ),

          padding: const EdgeInsets.all(20.0),
          color: Colors.orange,
          child: const Text(
            "This is my Container",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}