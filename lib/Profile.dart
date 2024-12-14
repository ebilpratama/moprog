import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0, // Hide app bar
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.purple.shade100,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(
                  'assets/profile_image.png'), // Replace with your profile image path
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Name"),
                  subtitle: Text("katarinabluu"),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Email account"),
                  subtitle: Text("katarinabluu@example.com"),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Phone"),
                  subtitle: Text("+1234567890"),
                ),
                Divider(thickness: 1),
              ],
            ),
          ),
          Spacer(), // Push content above to the top
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Logic untuk logout
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          // Contoh logout, ganti dengan logika Anda
                          Navigator.pop(context); // Close dialog
                          Navigator.pushReplacementNamed(
                              context, '/login'); // Redirect ke login
                        },
                        child: Text("Logout"),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
