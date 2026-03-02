import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Lab 1'),
          backgroundColor: Colors.blueAccent,
          // centerTitle: true,
        ),
        body: Column(
          children: [
            // Row as first child
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, size: 30 ,color: Colors.amber,),
                Icon(Icons.favorite, size: 30,color: Colors.brown,),
                Icon(Icons.settings, size: 30,color: Colors.grey,),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Assets Image",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            // Asset Image
            Image.asset(
              "assets/myimage.jpg",
              height: 150,
            ),

            const SizedBox(height: 20),

            const Text(
              "Network Image",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            // Network Image
            Image.network(
              "https://picsum.photos/200",
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}