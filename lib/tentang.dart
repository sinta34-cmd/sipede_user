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
            // Two images aligned side by side at the top
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/sipede_login.png', // Path to the first logo
                  height: 70,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/image/sipedebawah.png', // Path to the second logo
                  height: 70,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Title Container
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                border: Border.all(
                  color: const Color.fromARGB(255, 59, 167, 235),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Sistem Informasi Perangkat Desa (SiPeDe)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Description Container
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 167, 235),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'adalah sebuah aplikasi berbasis teknologi informasi yang dirancang khusus untuk membantu pemerintah desa dalam mengelola berbagai aktivitas dan data desa secara terintegrasi. SiPeDe bertujuan untuk meningkatkan efisiensi, transparansi, dan akuntabilitas dalam penyelenggaraan pemerintahan desa.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Functions Container
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 167, 235),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Fungsi dari SiPeDe:',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // First Function
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 167, 235),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '• Pengelolaan Data Desa: SiPeDe digunakan untuk mengumpulkan, menyimpan, dan mengelola berbagai jenis data desa, seperti data penduduk, data aset desa, data keuangan desa, data program pembangunan, dan lain sebagainya.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            // Second Function
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 167, 235),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '• Pelayanan Publik: SiPeDe dapat digunakan untuk memberikan berbagai layanan publik kepada masyarakat desa secara online, seperti pengurusan surat-menyurat, pelaporan pengaduan, dan akses informasi tentang desa.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
