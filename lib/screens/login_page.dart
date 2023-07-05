import 'dart:convert';

import 'package:aplikasisatu/config/environtment.dart';
import 'package:aplikasisatu/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String loginUrl = apiUrl;
  FocusNode usernameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              focusNode: usernameFocusNode,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                // Buat body permintaan dengan data username dan password
                Map<String, String> requestBody = {
                  'username': username,
                  'password': password,
                };

                // Kirim permintaan HTTP POST ke API login
                http
                    .post(Uri.parse(loginUrl), body: requestBody)
                    .then((response) {
                  if (response.statusCode == 200) {
                    var jsonResponse = jsonDecode(response.body);
                    bool status = jsonResponse['status'];
                    String msg = jsonResponse['msg'];

                    if (status == false) {
                      // Status adalah 0 (gagal login), tampilkan popup merah dengan pesan
                      Fluttertoast.showToast(
                          msg: msg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          webBgColor:
                              "linear-gradient(to right, #f21000, #f21000)",
                          fontSize: 16.0);
                      usernameController.clear();
                      passwordController.clear();

                      FocusScope.of(context).requestFocus(FocusNode());
                      FocusScope.of(context).requestFocus(usernameFocusNode);
                    } else {
                      Fluttertoast.showToast(
                          msg: msg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          webBgColor:
                              "linear-gradient(to right, #0eed0e, #0eed0e)",
                          fontSize: 16.0);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  } else {
                    Fluttertoast.showToast(
                        msg: "Maaf Server Sibuk.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
