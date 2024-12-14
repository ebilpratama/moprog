import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LibraryPage(),
//     );
//   }
// }

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Library',
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
          tabs: [
            Tab(text: 'Dipinjam'),
            Tab(text: 'Dikembalikan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Dipinjam
          ListView.builder(
            itemCount: 3, // Misal 3 buku
            itemBuilder: (context, index) {
              return BookCard();
            },
          ),
          // Tab Dikembalikan
          Center(
            child: Text('Belum ada buku yang dikembalikan.'),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Container sebagai tempat gambar cover buku
              Container(
                width: 70, // Lebar persegi panjang untuk cover buku
                height: 90, // Tinggi persegi panjang untuk cover buku
                color: Colors.grey[
                    300], // Warna placeholder, bisa diganti dengan image jika ada
                child: Icon(
                  Icons.book,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 16), // Jarak antara cover buku dan teks

              // Bagian kanan yang berisi informasi buku
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penulis',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Judul Buku',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Status'),
                    Text(
                      'Dipinjam',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text('Tanggal Pinjam'),
                    Text(
                      'dd-mm-yyyy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Tanggal Kembali'),
                    Text(
                      'dd-mm-yyyy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kembalikan buku dalam waktu 5 hari lagi!!!',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Implementasi logika untuk mengembalikan buku
                      },
                      child: Text('Kembalikan Buku'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
