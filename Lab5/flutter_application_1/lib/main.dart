import 'package:flutter/material.dart';

void main() {
  runApp( (homepage())); 
}
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isFollowed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Ahsan Ali',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowed = !isFollowed;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFollowed ? Colors.grey : Colors.blue,
                    ),
                    child: Text(
                      isFollowed ? 'Following' : 'Follow',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        score++;
                      });
                    },
                    iconSize: 28,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber, size: 32),
                  title: const Text(
                    'Likes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '$score likes',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Text(
                    '$score',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


