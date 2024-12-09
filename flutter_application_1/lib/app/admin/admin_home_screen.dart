import 'package:flutter/material.dart';
import 'admin_profile_screen.dart'; // Import the AdminProfileScreen
import 'admin_manage_requirement.dart'; // Import the AdminManageRequirementScreen

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  // Logout function
  void _logout(BuildContext context) {
    // Navigate back to the Login screen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        backgroundColor: Colors.blue, // Custom AppBar color
        elevation: 0, // Remove shadow for a flat look
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header with profile info
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Admin Profile',
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
                // Navigate to the AdminProfileScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminProfileScreen()),
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
            colors: [Colors.blue, Colors.purple], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  'Welcome, Admin!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Manage Requirements Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to AdminManageRequirementScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminManageRequirementScreen(),
                    ),
                  );
                },
                child: const Text('Manage Requirements'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.orangeAccent, // Button color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
