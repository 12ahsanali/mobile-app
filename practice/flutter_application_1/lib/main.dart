import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(title: Text("ListTile")),
       body: ListView(
        children: [
          Container(
 margin: EdgeInsets.all(10), // space outside the border
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // border
        borderRadius: BorderRadius.circular(10),           // rounded corners
      ),
         child: ListTile(title: Text("Ali")),
          ),
          Container(
 margin: EdgeInsets.all(10), // space outside the border
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // border
        borderRadius: BorderRadius.circular(10),           // rounded corners
      ),
         child: ListTile(title: Text("Ali")),
          ),
        ],
       )
    );
  }
}