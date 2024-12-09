import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'app/admin/admin_home_screen.dart';
import 'app/student/student_home_screen.dart';
import 'app/superadmin/superadmin_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clearance App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // LoginScreen will be the initial screen
      routes: {
        '/admin': (context) => AdminHomeScreen(),
        // '/student': (context) => StudentHomeScreen(),
        '/superAdmin': (context) => SuperAdminHomeScreen(),
        '/login': (context) => LoginScreen(), // Route for login screen
      },
    );
  }
}
