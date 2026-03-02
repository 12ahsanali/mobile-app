import 'package:flutter/material.dart';

class InfoCardTask extends StatelessWidget {
  const InfoCardTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card & ListTile Task"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  "Ahsan maqsood",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Registration No: 1130"),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.green.shade50,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.school,
                  color: Colors.green,
                  size: 35,
                ),
                title: const Text(
                  "ahsan ali",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                subtitle: const Text("Registration No: 1131"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}