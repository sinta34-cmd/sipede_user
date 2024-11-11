import 'package:flutter/material.dart';

class HasilForm2Page extends StatelessWidget {
 
  final String name = "John Doe";
  final String email = "johndoe@example.com";
  final String message = "Ini adalah contoh pesan.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pengisian Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hasil Pengisian Form',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Card untuk menampilkan data

            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: $name', style: TextStyle(fontSize: 18)),
                    Text('Email: $email', style: TextStyle(fontSize: 18)),
                    Text('Pesan: $message', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            // Spacer untuk mendorong tombol ke bawah
            Spacer(),
            // Tombol Upload dengan warna hijau
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol ditekan (misalnya, upload data)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Fungsi upload dipanggil')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.green, // Warna hijau
                  padding: EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15), // Padding tombol
                  textStyle: TextStyle(fontSize: 18), // Ukuran teks tombol
                ),
                child: Text('Upload'),
              ),
            ),
            SizedBox(height: 20), // Spasi di bawah tombol
          ],
        ),
      ),
    );
  }
}
