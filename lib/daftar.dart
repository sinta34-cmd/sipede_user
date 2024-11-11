import 'package:flutter/material.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Center(
                  // Bungkus dengan Center untuk menengahkan teks
                  child: Text(
                    'DAFTAR',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .blueAccent), // Atur gaya teks sesuai kebutuhan
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    filled: true, // Aktifkan background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan nama Anda';
                    }
                    return null;
                  },
                  autofillHints: null,
                  textCapitalization: TextCapitalization.none,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'NIK',
                    filled: true, // Aktifkan background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan NIK Anda';
                    }
                    return null;
                  },
                  autofillHints: null,
                  textCapitalization: TextCapitalization.none,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'No. KK',
                    filled: true, // Aktifkan background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan No. KK Anda';
                    }
                    return null;
                  },
                  autofillHints: null,
                  textCapitalization: TextCapitalization.none,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nomor Telepon',
                    filled: true, // Aktifkan background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan nomor telepon Anda';
                    }
                    return null;
                  },
                  autofillHints: null,
                  textCapitalization: TextCapitalization.none,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true, // Aktifkan background
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan email Anda';
                    }
                    return null;
                  },
                  autofillHints: null,
                  textCapitalization: TextCapitalization.none,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true, // Aktifkan background
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan password Anda';
                    }
                    return null;
                  },
                  autofillHints: null,
                  textCapitalization: TextCapitalization.none,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proses data pendaftaran di sini
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data berhasil dikirim!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna biru untuk tombol
                    foregroundColor: Colors.white, // Warna font putih
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