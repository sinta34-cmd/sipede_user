import 'package:flutter/material.dart';
import 'auth_service.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  final AuthService _authService = AuthService(); // Instance AuthService

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _noKkController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();

  bool _isLoading = false;

  // Fungsi untuk membuka date picker
  Future<void> _selectTanggalLahir(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _tanggalLahirController.text = "${picked.toLocal()}".split(' ')[0]; // Format tanggal
      });
    }
  }

  // Fungsi untuk mendaftarkan pengguna
  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      bool success = await _authService.registerUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        nama: _namaController.text.trim(),
        nik: _nikController.text.trim(),
        noKk: _noKkController.text.trim(),
        nomorTelepon: _nomorTeleponController.text.trim(),
      );

      setState(() {
        _isLoading = false;
      });

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registrasi berhasil!')),
        );
        Navigator.pop(context); // Kembali ke halaman sebelumnya
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registrasi gagal! Coba lagi.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Center(
                  child: Text(
                    'DAFTAR',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan nama Anda';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nikController,
                  decoration: const InputDecoration(
                    labelText: 'NIK',
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan NIK Anda';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _noKkController,
                  decoration: const InputDecoration(
                    labelText: 'No. KK',
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan No. KK Anda';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nomorTeleponController,
                  decoration: const InputDecoration(
                    labelText: 'Nomor Telepon',
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan nomor telepon Anda';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan email Anda';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan password Anda';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tanggalLahirController,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Lahir',
                    filled: true,
                  ),
                  readOnly: true,
                  onTap: () => _selectTanggalLahir(context), // Buka date picker
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan tanggal lahir Anda';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: _registerUser,
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
