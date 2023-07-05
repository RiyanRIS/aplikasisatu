import 'package:aplikasisatu/screens/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                // Implementasikan aksi saat menu 1 diklik
              },
            ),
            ListTile(
              title: Text('Pendaftar'),
              onTap: () {
                // Implementasikan aksi saat menu 2 diklik
              },
            ),
            ListTile(
              title: Text('Laporan'),
              onTap: () {
                // Implementasikan aksi saat menu 3 diklik
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                // Implementasikan aksi saat menu 4 diklik
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Selamat datang di halaman home!'),
      ),
    );
  }
}
