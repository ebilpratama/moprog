import 'package:flutter/material.dart';
import 'package:gebooks/librarypage.dart';
import 'package:gebooks/searchpage.dart';
import 'package:gebooks/profile.dart';
import 'package:gebooks/databuku.dart'; // Pastikan nama file Profile.dart adalah profile.dart

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; // Menyimpan indeks dari item yang dipilih

  // Daftar halaman
  final List<Widget> _pages = [
    HomeContent(), // Home Page Placeholder
    SearchPage(),
    LibraryPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update indeks yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[
          _currentIndex], // Menampilkan halaman sesuai dengan currentIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Menggunakan currentIndex dari state
        selectedItemColor: Colors.blue, // Warna ikon saat dipilih
        unselectedItemColor: Colors.grey, // Warna ikon saat tidak dipilih
        backgroundColor: Colors.white, // Warna background navigation bar
        onTap: _onItemTapped, // Memanggil fungsi saat item ditekan
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "#QOTD",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          "\"Nyantai or Die\"",
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          "- Laras Tekkom 22",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 16),

        // Books for Today Section
        const Text(
          "#Books for Today",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Replace with actual number of books
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookInformationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  color: Colors.grey[300],
                  child: Center(child: Text("Book $index")),
                ),
              );
            },
          ),
        ),

        // Repeat the same for "New Arrivals" and "Recent" sections
        const SizedBox(height: 16),
        const Text(
          "New Arrivals",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookInformationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  color: Colors.grey[300],
                  child: Center(child: Text("New Arrival $index")),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),
        const Text(
          "Recent",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookInformationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  color: Colors.grey[300],
                  child: Center(child: Text("Recent $index")),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}