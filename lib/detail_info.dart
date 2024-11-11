import 'package:flutter/material.dart';
import 'package:myapp/beranda.dart';
import 'package:myapp/fitur.dart';
import 'package:myapp/keunggulan.dart';
import 'package:myapp/team.dart';
import 'package:myapp/tentang.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => const Beranda()));
              },
            ),
            const Text("Info Sipede"),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Tentang Sipede"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TentangSiPeDe()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Fitur"),
            onTap: () {
              // Navigasi ke halaman Fitur
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Fitur()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Keunggulan"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KeunggulanSiPeDe()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Team"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const InformasiSistemPemerintahDesa()));
            },
          ),
        ],
      ),
    );
  }
}
