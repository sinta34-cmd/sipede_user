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
                const SizedBox(height: 20),
                CustomInputField(
                  controller: _namaController,
                  labelText: 'Nama',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan nama Anda';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  controller: _nikController,
                  labelText: 'NIK',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan NIK Anda';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  controller: _noKkController,
                  labelText: 'No. KK',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan No. KK Anda';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  controller: _nomorTeleponController,
                  labelText: 'No.telp',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan nomor telepon Anda';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan email Anda';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  controller: _passwordController,
                  labelText: 'Password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan password Anda';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  controller: _tanggalLahirController,
                  labelText: 'Tanggal Lahir',
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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

// Custom Input Field Widget
class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final bool readOnly;
  final Function()? onTap;
  final String? Function(String?)? validator;

  const CustomInputField({
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.readOnly = false,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        style: const TextStyle(
          color: Colors.grey, // Set text color to gray
        ),
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white, // Set background color to white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
