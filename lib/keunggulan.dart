import 'package:flutter/material.dart';

class KeunggulanSiPeDe extends StatelessWidget {
  const KeunggulanSiPeDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keunggulan SiPeDe'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logos at the top
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/image/sipede_login.png', // Ganti dengan path logo kiri
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image/sipedebawah.png', // Ganti dengan path logo kanan
                      height: 60,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Title
              
              const SizedBox(height: 10),
              // Feature 1
              buildFeatureCard(
                icon: Icons.access_time,
                text:
                    'Layanan dapat diakses kapan saja dan dimana saja, memudahkan masyarakat untuk mendapatkan layanan desa.',
              ),
              const SizedBox(height: 16),
              // Feature 2
              buildFeatureCard(
                icon: Icons.shield,
                text:
                    'Keamanan data terjamin, sehingga masyarakat tidak perlu khawatir akan kerahasiaan data pribadi.',
              ),
              const SizedBox(height: 16),
              // Feature 3
              buildFeatureCard(
                icon: Icons.phone_android,
                text:
                    'Aplikasi mudah digunakan dengan antarmuka yang ramah pengguna, cocok untuk semua kalangan usia.',
              ),
              const SizedBox(height: 16),
              // Feature 4
              buildFeatureCard(
                icon: Icons.support_agent,
                text:
                    'Tersedia layanan bantuan untuk masyarakat jika mengalami kesulitan dalam menggunakan aplikasi.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build each feature card
  Widget buildFeatureCard({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 59, 167, 235), // Background color
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}