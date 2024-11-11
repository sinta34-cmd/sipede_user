import 'package:flutter/material.dart';
import 'package:myapp/beranda.dart';
import 'package:myapp/detail_penduduk.dart';
import 'package:myapp/peta.dart';
import 'package:myapp/sejarah.dart';

class DetailDesa extends StatelessWidget {
  const DetailDesa({super.key});

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
            const Text("Tentang Desa"),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Sejarah Desa"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SejarahDesaScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Jumlah Penduduk"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JumlahPendudukScreen()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Peta"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PetaDesaPage()));
            },
          ),
        ],
      ),
    );
  }
}
