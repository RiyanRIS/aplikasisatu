import 'package:flutter/material.dart';
import 'package:aplikasisatu/screens/login_page.dart'; // Ganti `your_project_name` dengan nama proyek Anda

// void main() {
//   runApp(LoginApp());
// getx
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
