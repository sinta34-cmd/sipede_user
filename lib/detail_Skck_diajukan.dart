import 'package:flutter/material.dart';

class DetailSKCKDiajukan extends StatefulWidget {
  const DetailSKCKDiajukan({super.key});

  @override
  State<DetailSKCKDiajukan> createState() => _DetailSKCKDiajukanState();
}

class _DetailSKCKDiajukanState extends State<DetailSKCKDiajukan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Riwayat',style: TextStyle(fontWeight: FontWeight.bold),) // Menambahkan TextStyle
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.blue, // Warna abu-abu untuk tombol
                  minimumSize: const Size(170, 40),
                  foregroundColor: Colors.black, 
                  ),
                  onPressed: () {
                    // Aksi saat tombol "Diajukan" ditekan
                  },
                  child: const Text('Diajukan'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.grey, // Warna abu-abu untuk tombol "Disetujui"
    minimumSize: const Size(170, 40),
    foregroundColor: Colors.black, 
                  ),
                  onPressed: () {
                    // Aksi saat tombol "Disetujui" ditekan
                  },
                  child: const Text('Disetujui'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Surat Keterangan Catatan Kepolisian (SKCK)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text('Diajukan: 29/10/2024'),
            // Tambahkan detail riwayat lainnya di sini
          ],
        ),
      ),
    );
  }
}