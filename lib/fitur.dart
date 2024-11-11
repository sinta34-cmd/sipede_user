import 'package:flutter/material.dart';
class Fitur extends StatelessWidget {
  const Fitur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove title and leading from AppBar
      ),
      body:
 SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Custom App Bar within the page
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 16), // Spacing between back button and title
                  const Text(
                    'Fitur',
                    style: TextStyle(fontSize: 20, ),
                  ),
                ],
              ),
            ),
            // Rest of your content remains the same
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('image/sipede login.png', height: 70),
                const SizedBox(width: 10),
                Image.asset('image/sipedebawah.png', height: 50),
              ],
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.newspaper,
              iconColor: Colors.orange,
              title: 'Berita Desa',
              subtitle:
                  'Mengetahui jadwal kegiatan desa tanpa perlu melihat di papan pengumuman di kantor desa.',
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.document_scanner,
              iconColor: Colors.green,
              title: 'Layanan Mandiri',
              subtitle:
                  'Tidak perlu pergi ke kantor desa untuk mengurus surat, tinggal scan dan semua beres.',
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.report_problem,
              iconColor: Colors.red,
              title: 'Pengaduan Desa',
              subtitle:
                  'Masyarakat bisa mengadu jika terjadi sesuatu dan akan segera di proses',
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.photo_library,
              iconColor: Colors.purple,
              title: 'Dokumentasi',
              subtitle: 'Menyimpan foto dan bukti jika ada kegiatan desa.',
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.attach_money,
              iconColor: Colors.blueGrey,
              title: 'Dana Desa',
              subtitle:
                  'Masyarakat bisa melihat transparasi dana desa melihat dimana saja penyaluranya.',
            ),
            const SizedBox(height: 16),
            buildFeatureCard(
              icon: Icons.people,
              iconColor: Colors.brown,
              title: 'Perangkat Desa',
              subtitle:
                  'Masyarakat bisa mengetahui siapasaja yang menjabat dan profil lengkap perangkat desa.',
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
  }) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              size: 48,
              color: iconColor,
            ),
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
