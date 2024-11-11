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
              // Logo SiPeDe
              Image.asset(
                  'assets/images/logo_sipede.png'), // Ganti dengan path logo Anda
              const SizedBox(height: 20),
              // List keunggulan
              const Text('Keunggulan SiPeDe:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              // Item list pertama
              const Row(
                children: [
                  Icon(Icons.check_circle),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                        'Memiliki kualitas layanan yang baik. Dengan menggunakan aplikasi ini masyarakat dapat mengakses layanan desa kapan saja dan dimana saja.'),
                  ),
                ],
              ),
              // Item list kedua, ketiga, dan seterusnya (ikuti pola yang sama)
            ],
          ),
        ),
      ),
    );
  }
}
