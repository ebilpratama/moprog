import 'package:flutter/material.dart';

class AdminLibraryPage extends StatefulWidget {
  @override
  _AdminLibraryPageState createState() => _AdminLibraryPageState();
}

class _AdminLibraryPageState extends State<AdminLibraryPage>
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
            itemCount: 3, // Misal 3 buku, sesuaikan dengan jumlah data
            itemBuilder: (context, index) {
              return BookCard(); // Menggunakan widget BookCard untuk setiap buku
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
              // Placeholder for Book Cover Image
              Container(
                width: 70, // Width for book cover placeholder
                height: 90, // Height for book cover placeholder
                color: Colors.grey[300], // Placeholder color
                child: Icon(
                  Icons.book,
                  color: Colors.grey[700], // Book icon color
                ),
              ),
              SizedBox(width: 16), // Spacing between the cover and text

              // Book details section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penulis', // Author label
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Judul Buku', // Book title
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Peminjam'), // Status label
                    Text(
                      'Nama', // Book status
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text('Tanggal Pinjam'), // Borrow date label
                    Text(
                      'dd-mm-yyyy', // Borrow date placeholder
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Tanggal Kembali'), // Return date label
                    Text(
                      'dd-mm-yyyy', // Return date placeholder
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    // Text(
                    //   'Kembalikan buku dalam waktu 5 hari lagi!!!', // Warning message
                    //   style: TextStyle(color: Colors.red),
                    // ),
                    SizedBox(height: 8),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Logic to return the book
                    //   },
                    //   child: Text('Kembalikan Buku'), // Button to return book
                    // ),
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
