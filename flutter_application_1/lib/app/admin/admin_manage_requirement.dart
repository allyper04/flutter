import 'package:flutter/material.dart';
import 'admin_add_requirement.dart'; // Import the AdminAddRequirementScreen

class AdminManageRequirementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Container to wrap the Scaffold to apply gradient as a whole background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Custom AppBar with gradient
            PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                backgroundColor:
                    Colors.transparent, // Transparent background for AppBar
                elevation: 0, // Remove shadow
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple
                      ], // Gradient colors for AppBar
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                title: Text(
                  'Manage Requirements',
                  style:
                      TextStyle(color: Colors.white), // Text color for AppBar
                ),
              ),
            ),
            // Content of the screen
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Text displaying information
                      Text(
                        'Admin can manage the requirements here.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white), // Text color for contrast
                      ),
                      SizedBox(height: 20),
                      // Button to add requirements
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the AdminAddRequirementScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminAddRequirementScreen(),
                            ),
                          );
                        },
                        child: Text('Add Requirements'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent, // Button color
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
