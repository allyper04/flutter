import 'package:flutter/material.dart';
import 'superadmin_profile_screen.dart'; // Import the SuperAdminProfileScreen

class SuperAdminHomeScreen extends StatelessWidget {
  const SuperAdminHomeScreen({super.key});

  // Logout function
  void _logout(BuildContext context) {
    // Navigate back to the Login screen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Admin Home'),
        backgroundColor: Colors.red, // Custom AppBar color
        elevation: 0, // Remove shadow for a flat look
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header with profile info
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.supervised_user_circle,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Super Admin',
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
                // Navigate to the SuperAdminProfileScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SuperAdminProfileScreen()),
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
            colors: [Colors.red, Colors.deepOrange], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            'Welcome, Super Admin!',
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
