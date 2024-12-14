import 'package:flutter/material.dart';
import 'package:gebooks/adminlibrarypage.dart';
import 'package:gebooks/adminsearchpage.dart';
import 'package:gebooks/adminprofile.dart';
import 'package:gebooks/admindatabuku.dart'; // Pastikan file databuku.dart diimpor

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  _AdminpageState createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    AdminSearchPage(),
    AdminLibraryPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
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
          "HALO ADMIN 👋",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Grid 2 Baris yang Bisa di Scroll
        SizedBox(
          height: 220, // Tinggi total untuk menampung 2 baris kotak
          child: GridView.builder(
            scrollDirection: Axis.horizontal, // Scroll horizontal
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dua baris
              crossAxisSpacing: 8, // Jarak antar kolom
              mainAxisSpacing: 8, // Jarak antar baris
              childAspectRatio: 1, // Rasio lebar dan tinggi kotak
            ),
            itemCount: 10, // Jumlah total kotak
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman databuku.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookInformationScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Item ${index + 1}",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Jumlah Data Peminjaman
        const Text(
          "Jumlah Data Peminjaman",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5, // Ganti dengan jumlah data nyata
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 24,
                child: const Icon(Icons.book, color: Colors.white),
              ),
              title: const Text("Judul Buku"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Penulis"),
                  SizedBox(height: 4),
                  Text(
                    "Tersimpan 25%",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "75%",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: index % 2 == 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class DatabukuPage extends StatelessWidget {
  final int itemIndex;

  const DatabukuPage({Key? key, required this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Buku $itemIndex'),
      ),
      body: Center(
        child: Text(
          'Detail buku untuk Item $itemIndex',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
