import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class PengaturanAkunScreen extends StatefulWidget {
  const PengaturanAkunScreen({Key? key}) : super(key: key);

  @override
  _PengaturanAkunScreenState createState() => _PengaturanAkunScreenState();
}

class _PengaturanAkunScreenState extends State<PengaturanAkunScreen> {
  final TextEditingController nikController = TextEditingController();
  final TextEditingController kkController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController ttlController = TextEditingController();

  String? profileImageUrl;  // URL for profile image from Firebase Storage
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();  // Load user data when the screen loads
  }

  // Function to load user data from Firestore
  Future<void> _loadUserData() async {
    try {
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();
        if (userDoc.exists) {
          final data = userDoc.data()!;
          setState(() {
            nikController.text = data['nik'] ?? '';
            kkController.text = data['kk'] ?? '';
            namaController.text = data['nama'] ?? '';
            ttlController.text = data['ttl'] ?? '';
            profileImageUrl = data['profileImageUrl'];
          });
        }
      }
    } catch (e) {
      print("Failed to load user data: $e");
    }
  }

  // Function to pick and upload an image to Firebase Storage
  Future<void> _pickAndUploadImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_images/${user!.uid}.jpg');
        await storageRef.putFile(imageFile);
        final downloadUrl = await storageRef.getDownloadURL();

        // Update Firestore with the new profile image URL
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update({
          'profileImageUrl': downloadUrl,
        });

        setState(() {
          profileImageUrl = downloadUrl;
        });
      }
    } catch (e) {
      print("Failed to upload image: $e");
    }
  }

  // Function to save user data to Firestore
  Future<void> _saveUserData() async {
    try {
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .set({
          'nik': nikController.text,
          'kk': kkController.text,
          'nama': namaController.text,
          'ttl': ttlController.text,
          'profileImageUrl': profileImageUrl,
        }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data disimpan')),
        );
      }
    } catch (e) {
      print("Failed to save user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Akun'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Image Avatar
              Center(
                child: GestureDetector(
                  onTap: _pickAndUploadImage,  // Tap to pick and upload image
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl!)
                        : const AssetImage('assets/images/profile.png')
                            as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Text fields for user data
              TextField(
                controller: nikController,
                decoration: const InputDecoration(labelText: 'NIK'),
              ),
              TextField(
                controller: kkController,
                decoration: const InputDecoration(labelText: 'No. KK'),
              ),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: ttlController,
                decoration: const InputDecoration(labelText: 'Tempat, Tanggal Lahir'),
              ),
              
              const SizedBox(height: 20),
              
              // Save button
              ElevatedButton(
                onPressed: _saveUserData,
                child: const Text('SIMPAN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
