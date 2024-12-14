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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
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
                      Text('Tahun Terbit', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              TabBarViewWidget(),
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
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Sinopsis'),
              Tab(text: 'Detail Buku'),
              Tab(text: 'Peminjam'),
            ],
          ),
          Container(
            height: 300, // Adjust height as needed
            child: TabBarView(
              children: [
                // Sinopsis Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Nullam id justo id ante convallis elementum...',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),
                // Detail Buku Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Penerbit', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Nama Penerbit'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Panjang', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Angka'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Berat', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Angka'),
                        ],
                      ),
                    ],
                  ),
                ),
                // Peminjam Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: 3, // Replace with your dynamic data count
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text('Nama Pengguna'),
                        subtitle: Text('Tanggal Pinjam: dd-mm-yyyy\nTanggal Kembali: dd-mm-yyyy'),
                        trailing: IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            // Handle delete action
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
