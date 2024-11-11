import 'package:flutter/material.dart';

class DetailProfiL3 extends StatefulWidget {
  const DetailProfiL3({super.key});

  @override
  State<DetailProfiL3> createState() => _DetailProfiL3State();
}

class _DetailProfiL3State extends State<DetailProfiL3> {
  bool isEditing = false;

  // Variabel yang bisa diubah
  String nama = 'Julian Dyrroth, S.ML';
  String jabatan = 'Badan Permusyawaratan Desa';
  String alamat = 'ExPRejo RT 01 RW 02, Desa Legend';
  String pendidikan = 'S1';
  String noTelepon = '081234567890';
  String email = 'JulianTampan123S@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: Colors.white,
            elevation: 1,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Profil Perangkat Desa',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: const DecorationImage(
                              image: AssetImage('image/bp.julian.jpg'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.blue, size: 20),
                            onPressed: () {
                              // Fungsi untuk mengubah atau menghapus gambar
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Ubah Gambar"),
                                    content: const Text("Pilih tindakan:"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          // Tambahkan fungsi ubah gambar di sini
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ubah Gambar"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Tambahkan fungsi hapus gambar di sini
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Hapus Gambar"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(Text('Nama')),
                        DataCell(
                          isEditing
                              ? TextField(
                                  controller: TextEditingController(text: nama),
                                  onChanged: (value) => nama = value,
                                )
                              : Text(nama),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Jabatan')),
                        DataCell(
                          isEditing
                              ? TextField(
                                  controller:
                                      TextEditingController(text: jabatan),
                                  onChanged: (value) => jabatan = value,
                                )
                              : Text(jabatan),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Alamat')),
                        DataCell(
                          isEditing
                              ? TextField(
                                  controller:
                                      TextEditingController(text: alamat),
                                  onChanged: (value) => alamat = value,
                                )
                              : Text(alamat),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Pendidikan Terakhir')),
                        DataCell(
                          isEditing
                              ? TextField(
                                  controller:
                                      TextEditingController(text: pendidikan),
                                  onChanged: (value) => pendidikan = value,
                                )
                              : Text(pendidikan),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('No. Telepon')),
                        DataCell(
                          isEditing
                              ? TextField(
                                  controller:
                                      TextEditingController(text: noTelepon),
                                  onChanged: (value) => noTelepon = value,
                                )
                              : Text(noTelepon),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('E-mail')),
                        DataCell(
                          isEditing
                              ? TextField(
                                  controller:
                                      TextEditingController(text: email),
                                  onChanged: (value) => email = value,
                                )
                              : Text(email),
                        ),
                      ]),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditing = !isEditing;
                        });

                        if (!isEditing) {
                          // Simpan data setelah selesai mengedit
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data berhasil disimpan")),
                          );
                        }
                      },
                      child: Text(isEditing ? 'Simpan' : 'Edit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
