import 'package:flutter/material.dart';
import 'package:gebooks/homepage.dart';
import 'package:gebooks/searchpage.dart';
import 'package:gebooks/librarypage.dart';
import 'package:gebooks/loginpage.dart';
import 'package:gebooks/registerpage.dart'; // Halaman register
import 'package:gebooks/adminpage.dart'; // Halaman admin
 void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Halaman awal aplikasi
      routes: {
        '/login': (context) => LoginPage(), // Halaman login
        '/home': (context) => Homepage(), // Halaman utama untuk pengguna
        '/admin': (context) => Adminpage(), // Halaman utama untuk admin
      },
    );
  }
}
