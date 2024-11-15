import 'package:flutter/material.dart';
import 'package:myapp/detail_dokumen.dart';
import 'package:myapp/detail_dokumen2.dart';
import 'package:myapp/detail_dokumen4.dart';
import 'detail_dokumen1.dart';
import 'detail_dokumen3.dart';

class Dokumen extends StatelessWidget {
  const Dokumen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  "Dokumentasi",
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: "Cari dokumen...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildImageItem("Kerja Bakti", "image/kerjabktikampung.jpg",
                      context, const DetailDokumen1()),
                  _buildImageItem("Hantu Kampung", "assets/image/hantu1.jpg",
                      context, const DetailDokumen2()),
                  _buildImageItem("Pertanian", "assets/image/tani1.jpg", context,
                      const DetailDokumen4()),
                  _buildImageItem("17 Agustus", "assets/image/agustus2.jpg", context,
                      const DetailDokumen3()),
                  // Tambahkan gambar lainnya di sini
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      _buildImageItem("Gambar Lain", "assets/image/desa1.jpg",
                          context, const DetailDokumen1()),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailDokumen()));
                        },
                        icon: const Icon(Icons.archive),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageItem(
    String title,
    String imagePath,
    BuildContext context,
    Widget halaman,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => halaman));
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
