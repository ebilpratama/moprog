import 'package:flutter/material.dart';

class BookInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Informasi Buku',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Judul Buku',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Nama Penulis',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('130',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Halaman', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Indonesia',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Bahasa', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('2024',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Tahun Terbit',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              TabBarViewWidget(),
              SizedBox(height: 20), // Add some space before the button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Pinjam', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Sinopsis'),
              Tab(text: 'Detail Buku'),
            ],
          ),
          Container(
            height: 200, // Adjust height as needed
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Nullam id justo id ante convallis elementum. Sed nibh mi, '
                    'aliquam in est sed, cursus placerat justo. '
                    '... (additional text as needed)',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),
                Center(child: Text('Detail Buku Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
