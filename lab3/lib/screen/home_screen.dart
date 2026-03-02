import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Cards Task"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[200],

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Card(
              color: Colors.lightBlue,
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.home, size: 30, color: Colors.white),
                    Icon(Icons.star, size: 40, color: Colors.yellow),
                    Icon(Icons.settings, size: 35, color: Colors.black),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.green,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.favorite, size: 50, color: Colors.red),
                    SizedBox(height: 10),
                    Icon(Icons.thumb_up, size: 35, color: Colors.white),
                    SizedBox(height: 10),
                    Icon(Icons.message, size: 30, color: Colors.black),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.purple,
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.camera, size: 45, color: Colors.white),
                    Icon(Icons.music_note, size: 35, color: Colors.yellow),
                    Icon(Icons.phone, size: 30, color: Colors.green),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}