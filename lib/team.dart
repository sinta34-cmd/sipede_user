import 'package:flutter/material.dart';

class InformasiSistemPemerintahDesa extends StatelessWidget {
  const InformasiSistemPemerintahDesa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Sistem Pemerintah Desa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logos at the top
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/sipede login.png', // Update with actual logo path
                    height: 60,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/image/sipedebawah.png', // Update with actual logo path
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title and description
              const Text(
                'SipeDe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Sistem Informasi Pemerintah Desa',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Team heading
              const Text('Team Kami:', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),

              // Team Profiles
              _buildProfile(
                imageUrl: 'https://example.com/dwi_resti_kartika.jpg',
                name: 'Dwi Resti Kartika',
              ),
              const SizedBox(height: 20),
              _buildProfile(
                imageUrl: 'https://example.com/sinta_febriyanti.jpg',
                name: 'Sinta Febriyanti',
              ),
              const SizedBox(height: 20),
              _buildProfile(
                imageUrl: 'https://example.com/siti_wahyuni.jpg',
                name: 'Siti Wahyuni',
              ),
              const SizedBox(height: 20),

              // Contact Information
              const Text('087562429876', style: TextStyle(fontSize: 16)),
              const Text('Sipede@gmail.com', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  // Profile widget with resized profile image
  Widget _buildProfile({required String imageUrl, required String name}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40, // Smaller radius for profile image
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(imageUrl),
          onBackgroundImageError: (exception, stackTrace) {
            debugPrint('Failed to load image: $imageUrl');
          },
          child: Icon(Icons.person, size: 40, color: Colors.grey[400]),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
