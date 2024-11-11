import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LayananMandiri extends StatefulWidget {
  const LayananMandiri({super.key});

  @override
  State<LayananMandiri> createState() => _LayananMandiriState();
}

class _LayananMandiriState extends State<LayananMandiri> {
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
        title: const Text('Layanan Mandiri'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Diajukan'),
                Tab(text: 'Disetujui'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildSuratList(status: 'Diajukan'),
                  _buildSuratList(status: 'Disetujui'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuratList({required String status}) {
    final List<Map<String, dynamic>> suratList = [
      {
        'nama': 'Surat Pengantar SKCK',
        'tanggal': '2023-12-15',
        'status': status,
        'url': 'https://example.com/surat1.pdf',
        'imagePath': 'image/SKCK.jpg', // Local asset path
      },
      {
        'nama': 'Surat Keterangan Domisili',
        'tanggal': '2023-12-10',
        'status': status,
        'url': 'https://example.com/surat2.pdf',
        'imagePath': 'image/SKCK.jpg', // Local asset path
      },
    ];

    return ListView.builder(
      itemCount: suratList.length,
      itemBuilder: (context, index) {
        final surat = suratList[index];
        return ListTile(
          title: Text(surat['nama']),
          subtitle:
              Text('Tanggal: ${surat['tanggal']} \nStatus: ${surat['status']}'),
          trailing: status == 'Disetujui'
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        _viewSurat(context, surat['imagePath']);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: () {
                        _downloadFile(surat['url'], surat['nama']);
                      },
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }

  void _viewSurat(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewImagePage(imagePath: imagePath),
      ),
    );
  }

  Future<void> _downloadFile(String url, String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName.pdf';
      await Dio().download(url, filePath);

      // Tampilkan dialog setelah unduhan berhasil
      if (context.mounted) {
        _showDownloadDialog(filePath);
      }
    } catch (e) {
      print("Error saat mengunduh file: $e");
    }
  }

  void _showDownloadDialog(String filePath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unduhan Berhasil'),
        content: const Text('File berhasil diunduh dan disimpan secara lokal.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Tutup'),
          ),
          TextButton(
            onPressed: () {
              OpenFile.open(filePath); // Membuka file yang diunduh
              Navigator.of(context).pop();
            },
            child: const Text('Buka File'),
          ),
        ],
      ),
    );
  }
}

class PreviewImagePage extends StatelessWidget {
  final String imagePath;

  const PreviewImagePage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Surat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
