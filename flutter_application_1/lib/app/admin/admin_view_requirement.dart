import 'package:flutter/material.dart';

class AdminViewRequirementScreen extends StatelessWidget {
  // This is just a placeholder for the requirement data.
  final List<Map<String, String>> requirements = [
    {'name': 'Thesis Submission', 'deadline': '2024-12-31', 'time': '15:00'},
    {'name': 'Final Exam', 'deadline': '2025-01-15', 'time': '10:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Requirements'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: requirements.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(requirements[index]['name']!),
                subtitle: Text(
                    'Deadline: ${requirements[index]['deadline']}, Time: ${requirements[index]['time']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
