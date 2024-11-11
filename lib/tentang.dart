import 'package:flutter/material.dart';

class TentangSiPeDe extends StatelessWidget {
  const TentangSiPeDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang SiPeDe'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo_sipede.png'), // Ganti dengan path logo Anda
            const SizedBox(height: 16),
            const Text(
              'Sistem Informasi Perangkat Desa (SiPeDe)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'adalah sebuah aplikasi berbasis teknologi informasi yang dirancang khusus untuk membantu pemerintah desa dalam mengelola berbagai aktivitas dan data desa secara terintegrasi. SiPeDe bertujuan untuk meningkatkan efisiensi, transparansi, dan akuntabilitas dalam penyelenggaraan pemerintahan desa.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text('Fungsi dari SiPeDe:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              '• Pengelolaan Data Desa: SiPeDe digunakan untuk mengumpulkan, menyimpan, dan mengelola berbagai jenis data desa, seperti data penduduk, data aset desa, data keuangan desa, data program pembangunan, dan lain sebagainya.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '• Pelayanan Publik: SiPeDe dapat digunakan untuk memberikan berbagai layanan publik kepada masyarakat desa secara online, seperti pengurusan surat-menyurat, pelaporan pengaduan, dan akses informasi tentang desa.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}