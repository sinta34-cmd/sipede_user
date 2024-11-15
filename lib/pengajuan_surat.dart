import 'package:flutter/material.dart';
import 'package:myapp/layanan_mandiri.dart';
import 'package:myapp/surat_keterangan.dart';
import 'package:myapp/surat_pengantar.dart';

class PengajuanSurat extends StatelessWidget {
  const PengajuanSurat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Layanan Mandiri'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/image/sipede login.png', height: 40),
                    const SizedBox(width: 5),
                    Image.asset('assets/image/sipedebawah.png', height: 40),
                  ],
                ),
                ElevatedButton(
                  // Tombol Riwayat
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayananMandiri()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna tombol
                    foregroundColor: Colors.white, // Warna teks tombol
                  ),
                  child: const Text('Riwayat'),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Ubah mainAxisAlignment
              children: [
                // Gabungkan teks dan gambar dalam Row
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem('Surat Pengantar', context, Colors.blue),
                _buildMenuItem('Surat Keterangan', context, Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, BuildContext context, Color tileColor) {
    return Card(
      // Bungkus ListTile dengan Card
      shape: RoundedRectangleBorder(
        // Berikan bentuk lonjong
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: tileColor,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {
          // Navigasi ke halaman pembuatan surat yang dipilih
          // Misalnya:
          if (title == 'Surat Pengantar') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BuatSuratPengantar()), // Ganti dengan halaman pembuatan surat SKTM
            );
          } else if (title == 'Surat Keterangan') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BuatSuratKeterangan()), // Ganti dengan halaman pembuatan surat SKD
            );
          } // ... tambahkan navigasi untuk surat lainnya
        },
      ),
    );
  }
}