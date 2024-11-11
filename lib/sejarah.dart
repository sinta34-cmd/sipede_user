import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SejarahDesaScreen extends StatefulWidget {
  const SejarahDesaScreen({super.key});

  @override
  _SejarahDesaScreenState createState() => _SejarahDesaScreenState();
}

class _SejarahDesaScreenState extends State<SejarahDesaScreen> {
  // Firestore reference to the "sejarahDesa" document
  final DocumentReference sejarahDesaDoc =
      FirebaseFirestore.instance.collection('villageData').doc('sejarahDesa');

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _formationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final snapshot = await sejarahDesaDoc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _titleController.text = data['title'] ?? 'DESA EMEL HARJO';
          _originController.text = data['origin'] ??
              'Karanganyar berdiri pada tahun yang tidak diketahui sejarahnya...';
          _formationController.text = data['formation'] ??
              'Hingga saat ini pemerintah desa Karanganyar belum menemukan dokumen...';
        });
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load data: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sejarah Desa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _titleController.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Asal-Usul',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              _originController.text,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text('Pembentukan Desa',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              _formationController.text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
