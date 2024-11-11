import 'package:flutter/material.dart';

class SKCK extends StatefulWidget {
  const SKCK({super.key});

  @override
  State<SKCK> createState() => _SKCKState();
}

class _SKCKState extends State<SKCK> {
  final _formKey = GlobalKey<FormState>();

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
        title: const Text('Pengajuan SKCK'),
      ),
      body: Form(
        key: _formKey,
         child: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ const Text(
                  'Silahkan isi data berikut',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                   border: OutlineInputBorder(),
                    
                ),
                
                
validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Lengkap harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis Kelamin harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tempat Tanggal Lahir',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tempat Tanggal Lahir harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Status Perkawinan',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Status Perkawinan harus diisi';
                  }
                  return null;
                },
              ),
              
TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kewarganegaraan',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kewarganegaraan harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Agama',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Agama harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Pekerjaan',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pekerjaan harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'NIK',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIK harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                   border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proses data pengajuan SKCK di sini
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pengajuan SKCK berhasil!')),
                    );
                  }
                },
                
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