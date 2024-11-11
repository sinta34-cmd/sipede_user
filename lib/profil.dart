import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Profil Perangkat Desa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('profiles').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final profiles = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: profiles.length,
                    itemBuilder: (context, index) {
                      final profile = profiles[index];
                      final name = profile['name'];
                      final position = profile['position'];
                      final imagePath = profile['imagePath'] ?? 'assets/image/default.jpg';

                      return _buildMenuButton(
                        name,
                        position,
                        imagePath,
                        context,
                        DetailProfil1(profileId: profile.id),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewProfile()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMenuButton(String title, String deskripsi, String imagePath,
      BuildContext context, Widget halaman) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: const Size.fromHeight(80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => halaman));
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: imagePath.startsWith('assets/')
                  ? AssetImage(imagePath)
                  : NetworkImage(imagePath) as ImageProvider,
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  deskripsi,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailProfil1 extends StatelessWidget {
  final String profileId;

  const DetailProfil1({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Perangkat Desa'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('profiles').doc(profileId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final profileData = snapshot.data!.data() as Map<String, dynamic>;
          final imagePath = profileData['imagePath'] ?? 'assets/image/default.jpg';

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: imagePath.startsWith('assets/')
                    ? AssetImage(imagePath)
                    : NetworkImage(imagePath) as ImageProvider,
              ),
              const SizedBox(height: 20),
              _buildDetailRow('Nama', profileData['name']),
              _buildDetailRow('Jabatan', profileData['position']),
              _buildDetailRow('Alamat', profileData['address']),
              _buildDetailRow('Pendidikan', profileData['education']),
              _buildDetailRow('Nomor Telepon', profileData['phone']),
              _buildDetailRow('Email', profileData['email']),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class NewProfile extends StatefulWidget {
  const NewProfile({super.key});

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _position = '';
  String _address = '';
  String _education = '';
  String _phone = '';
  String _email = '';
  XFile? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = selectedImage;
    });
  }

  void _saveProfileToFirestore() async {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();

      final profileData = {
        'name': _name,
        'position': _position,
        'address': _address,
        'education': _education,
        'phone': _phone,
        'email': _email,
        'imagePath': _imageFile != null ? _imageFile!.path : null,
      };

      await FirebaseFirestore.instance.collection('profiles').add(profileData);

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile added successfully")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _imageFile != null
                      ? FileImage(File(_imageFile!.path))
                      : null,
                  child: _imageFile == null
                      ? const Icon(Icons.add_a_photo, size: 50)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Position'),
                onSaved: (value) => _position = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                onSaved: (value) => _address = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Education'),
                onSaved: (value) => _education = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => _phone = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfileToFirestore,
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
