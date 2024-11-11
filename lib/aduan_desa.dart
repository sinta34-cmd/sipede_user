import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AduanDesa extends StatefulWidget {
  const AduanDesa({super.key});

  @override
  State<AduanDesa> createState() => _AduanDesaState();
}

class _AduanDesaState extends State<AduanDesa> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _pesanController = TextEditingController();

  final CollectionReference _aduanCollection =
      FirebaseFirestore.instance.collection('aduan'); // Firestore collection reference

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to previous page
          },
        ),
        title: const Text('Aduan Desa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _alamatController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _pesanController,
                  decoration: const InputDecoration(labelText: 'Pesan'),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pesan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Send data to Firebase
                      await _aduanCollection.add({
                        'nama': _namaController.text,
                        'alamat': _alamatController.text,
                        'pesan': _pesanController.text,
                        'timestamp': FieldValue.serverTimestamp(), // add timestamp
                      });

                      // Show feedback and clear form
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Aduan terkirim')),
                      );
                      _namaController.clear();
                      _alamatController.clear();
                      _pesanController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
