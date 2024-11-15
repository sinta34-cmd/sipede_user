import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuatSuratPengantar extends StatefulWidget {
  const BuatSuratPengantar({super.key});

  @override
  _BuatSuratPengantarState createState() => _BuatSuratPengantarState();
}

class _BuatSuratPengantarState extends State<BuatSuratPengantar> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jenisKelaminController = TextEditingController();
  final TextEditingController _ttlController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _kewarganegaraanController = TextEditingController();
  final TextEditingController _agamaController = TextEditingController();
  final TextEditingController _pekerjaanController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  String? _selectedSuratType;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Prepare the document data to be added
        final documentData = {
          'nama': _namaController.text,
          'jenisKelamin': _jenisKelaminController.text,
          'ttl': _ttlController.text,
          'statusPerkawinan': _statusController.text,
          'kewarganegaraan': _kewarganegaraanController.text,
          'agama': _agamaController.text,
          'pekerjaan': _pekerjaanController.text,
          'nik': _nikController.text,
          'alamat': _alamatController.text,
          'jenisSurat': _selectedSuratType,
          'tanggalPengajuan': Timestamp.now(),
          'status': 'Diajukan', // Set initial status as "Diajukan"
          'diajukan': true, // Adding the "diajukan" field
        };

        // Add to surat_pengantar collection
        await FirebaseFirestore.instance.collection('surat_pengantar').add(documentData);

        // Add to pengajuan collection
        await FirebaseFirestore.instance.collection('pengajuan').add(documentData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pengajuan surat berhasil diajukan')),
        );
        Navigator.pop(context); // Optionally, close the form after submission
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengajukan surat: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _jenisKelaminController.dispose();
    _ttlController.dispose();
    _statusController.dispose();
    _kewarganegaraanController.dispose();
    _agamaController.dispose();
    _pekerjaanController.dispose();
    _nikController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Surat Pengantar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Nama Lengkap harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _jenisKelaminController,
                  decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Jenis Kelamin harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _ttlController,
                  decoration: const InputDecoration(labelText: 'Tempat Tanggal Lahir'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Tempat Tanggal Lahir harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _statusController,
                  decoration: const InputDecoration(labelText: 'Status Perkawinan'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Status Perkawinan harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _kewarganegaraanController,
                  decoration: const InputDecoration(labelText: 'Kewarganegaraan'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Kewarganegaraan harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _agamaController,
                  decoration: const InputDecoration(labelText: 'Agama'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Agama harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _pekerjaanController,
                  decoration: const InputDecoration(labelText: 'Pekerjaan'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Pekerjaan harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _nikController,
                  decoration: const InputDecoration(labelText: 'NIK'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'NIK harus diisi'
                      : null,
                ),
                TextFormField(
                  controller: _alamatController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Alamat harus diisi'
                      : null,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Jenis Surat'),
                  value: _selectedSuratType,
                  onChanged: (newValue) => setState(() => _selectedSuratType = newValue),
                  items: <String>['Pengantar SKCK', 'Pengantar Izin Keramaian', 'Lainnya']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Jenis Surat harus dipilih' : null,
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Ajukan Surat'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
