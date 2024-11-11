import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetaDesaPage extends StatefulWidget {
  const PetaDesaPage({super.key});

  @override
  State<PetaDesaPage> createState() => _PetaDesaPageState();
}

class _PetaDesaPageState extends State<PetaDesaPage> {
  String villageName = 'Wilayah Desa Karanganyar';
  String mapImageUrl = ''; // URL to display the map image from Firebase Storage

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadVillageData();
  }

  Future<void> _loadVillageData() async {
    // Load village data from Firestore
    final doc =
        await firestore.collection('villageData').doc('villageInfo').get();
    if (doc.exists) {
      setState(() {
        villageName = doc['name'] ?? 'Wilayah Desa Karanganyar';
        mapImageUrl = doc['mapImageUrl'] ?? '';
      });
    }
  }

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
        title: const Text('Peta Desa'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display Village Name
            Text(
              villageName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Map Container
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: mapImageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(mapImageUrl, fit: BoxFit.cover),
                    )
                  : const Center(child: Text('Peta desa tidak tersedia')),
            ),
          ],
        ),
      ),
    );
  }
}
