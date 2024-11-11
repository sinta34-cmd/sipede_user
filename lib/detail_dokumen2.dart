import 'package:flutter/material.dart';

class DetailDokumen2 extends StatefulWidget {
  const DetailDokumen2({super.key});

  @override
  _DetailDokumen2State createState() => _DetailDokumen2State();
}

class _DetailDokumen2State extends State<DetailDokumen2> {
  final List<Map<String, String>> images = [
    {"title": "17 Agustus", "imagePath": "assets/image/hantu1.jpg", "tanggal": "2023-08-17"},
    {"title": "17 Agustus", "imagePath": "assets/image/hantu2.jpg", "tanggal": "2023-08-17"},
    {"title": "17 Agustus", "imagePath": "assets/image/hantu3.jpg", "tanggal": "2023-08-17"},
    {"title": "17 Agustus", "imagePath": "assets/image/hantu4.jpg", "tanggal": "2023-08-17"},
    {"title": "17 Agustus", "imagePath": "assets/image/hantu5.jpg", "tanggal": "2023-08-17"},
  ];
  final Set<int> selectedIndexes = {};

  void _addImage() {
    setState(() {
      images.add({"title": "New Image", "imagePath": "image/newimage.jpg", "tanggal": "2023-08-18"});
    });
  }

  void _deleteSelectedImages() {
    setState(() {
      selectedIndexes.toList().forEach((index) {
        images.removeAt(index);
      });
      selectedIndexes.clear();
    });
  }

  void _saveImages() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Images saved successfully")),
    );
  }

  void _downloadImage(String imagePath) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Downloading $imagePath...")),
    );
  }

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
                  "17 Agustus",
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text("Dusun: MIDLANEREJO"),
            const Text("RT/RW: 003/008"),
            const SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _addImage,
                  child: const Text("Tambah"),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: selectedIndexes.isNotEmpty ? _deleteSelectedImages : null,
                  child: const Text("Hapus"),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _saveImages,
                  child: const Text("Simpan"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  final image = images[index];
                  return GestureDetector(
                    onLongPress: () {
                      _showDownloadPopup(image["imagePath"]!);
                    },
                    onTap: () {
                      setState(() {
                        if (selectedIndexes.contains(index)) {
                          selectedIndexes.remove(index);
                        } else {
                          selectedIndexes.add(index);
                        }
                      });
                    },
                    child: _buildImageItem(
                      image["title"]!,
                      image["imagePath"]!,
                      image["tanggal"]!,
                      isSelected: selectedIndexes.contains(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDownloadPopup(String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Download this image?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _downloadImage(imagePath);
              },
              child: const Text("Download"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImageItem(String title, String imagePath, String tanggal, {bool isSelected = false}) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.transparent,
                width: 3.0,
              ),
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
        Text(tanggal),
      ],
    );
  }
}
