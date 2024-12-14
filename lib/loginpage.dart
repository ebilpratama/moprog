import 'package:flutter/material.dart';
import 'adminpage.dart';
import 'homepage.dart';
import 'registerpage.dart'; // Mengimpor halaman register

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final users = [
    {"email": "admin@example.com", "password": "admin123", "role": "admin"},
    {"email": "user@example.com", "password": "user123", "role": "user"},
  ];

  void login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      // Cari user berdasarkan email dan password
      Map<String, String> user = users.firstWhere(
        (user) => user["email"] == email && user["password"] == password,
      );

      // Redirect berdasarkan role
      if (user["role"] == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Adminpage()),
        );
      } else if (user["role"] == "user") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      }
    } catch (e) {
      // Jika login gagal (user tidak ditemukan)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            // Tambahkan teks biasa dengan tombol Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"), // Teks biasa
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Register here"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
