import 'package:flutter/material.dart';

class InformasiSistemPemerintahDesa extends StatelessWidget {
  const InformasiSistemPemerintahDesa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Sistem Pemerintah Desa'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SipeDe'),
            Text('Sistem Informasi Pemerintah Desa'),
            SizedBox(height: 20),
            Text('Team Kami:'),
            SizedBox(height: 10),
            Text('Dwi Resti Kartika'),
            Text('Sinta Febriyanti'),
            Text('Siti Wahyuni'),
            SizedBox(height: 10),
            Text('087562429876'),
            Text('Sipede@gmail.com'),
          ],
        ),
      ),
    );
  }
}
