import 'package:flutter/material.dart';

class DetailAduanDesa extends StatefulWidget {
  const DetailAduanDesa({super.key});

  @override
  State<DetailAduanDesa> createState() => _DetailAduanDesaState();
}

class _DetailAduanDesaState extends State<DetailAduanDesa> {
  List<Map<String, dynamic>> dataAduan = [
    {
      'nama': 'Resty Fufufafa',
      'alamat': 'Jl. Konoha',
      'pesan': 'Jalan rusak di depan rumah saya.',
    },
    // Tambahkan data aduan lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Tambahkan leading property di sini
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
        title: const Text('Hasil Aduan'),
      ),
      body: ListView.builder(
        itemCount: dataAduan.length,
        itemBuilder: (context, index) {
          final aduan = dataAduan[index];
          return ListTile(
            tileColor: Colors.blue[200],
            title: Text(aduan['nama']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(aduan['alamat']),
                Text(aduan['pesan']),
              ],
            ),
          );
        },
      ),
    );
  }
}
