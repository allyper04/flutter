import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/student/notification.dart';
import 'student_profile_screen.dart'; // Import the StudentProfileScreen

class StudentHomeScreen extends StatelessWidget {
  final dynamic user;
  const StudentHomeScreen(this.user, {super.key});

  // Logout function
  void _logout(BuildContext context) {
    // Navigate back to the Login screen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Home'),
        backgroundColor: Colors.green, // Custom AppBar color
        elevation: 0, // Remove shadow for a flat look
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // You can handle the notification button press here
              // For example, navigate to a notification screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const NotificationPage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header with profile info
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Student Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Profile option
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                // Navigate to the StudentProfileScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentProfileScreen(user)),
                );
              },
            ),
            const Divider(),
            // Logout option
            ListTile(
              title: const Text('Log out'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                // Call the logout function
                _logout(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.teal], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            'Welcome, Student! ${user["name"]}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
