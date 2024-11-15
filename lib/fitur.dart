import 'package:flutter/material.dart';

class Fitur extends StatelessWidget {
  const Fitur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitur'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/sipede login.png', height: 70),
                const SizedBox(width: 10),
                Image.asset('assets/image/sipedebawah.png', height: 50),
              ],
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.newspaper,
              iconColor: Colors.orange,
              title: 'Berita Desa',
              subtitle:
                  'Mengetahui jadwal kegiatan desa tanpa perlu melihat di papan pengumuman di kantor desa.',
              cardColor: const Color.fromARGB(255, 59, 167, 235),
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.document_scanner,
              iconColor: Colors.green,
              title: 'Layanan Mandiri',
              subtitle:
                  'Tidak perlu pergi ke kantor desa untuk mengurus surat, tinggal scan dan semua beres.',
              cardColor: const Color.fromARGB(255, 59, 167, 235),
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.report_problem,
              iconColor: Colors.red,
              title: 'Pengaduan Desa',
              subtitle:
                  'Masyarakat bisa mengadu jika terjadi sesuatu dan akan segera diproses.',
              cardColor: const Color.fromARGB(255, 59, 167, 235),
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.photo_library,
              iconColor: Colors.purple,
              title: 'Dokumentasi',
              subtitle: 'Menyimpan foto dan bukti jika ada kegiatan desa.',
              cardColor: const Color.fromARGB(255, 59, 167, 235),
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.attach_money,
              iconColor: Colors.blueGrey,
              title: 'Dana Desa',
              subtitle:
                  'Masyarakat bisa melihat transparansi dana desa dan penggunaannya.',
              cardColor: const Color.fromARGB(255, 59, 167, 235),
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.people,
              iconColor: Colors.brown,
              title: 'Perangkat Desa',
              subtitle:
                  'Masyarakat bisa mengetahui siapa saja yang menjabat dan profil lengkap perangkat desa.',
              cardColor: const Color.fromARGB(255, 59, 167, 235),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color cardColor,
  }) {
    return Card(
      color: cardColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
