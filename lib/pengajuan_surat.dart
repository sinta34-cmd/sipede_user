import 'package:flutter/material.dart';
import 'package:myapp/layanan_mandiri.dart';

class PengajuanSurat extends StatelessWidget {
  const PengajuanSurat({super.key});

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
        title: const Text('Layanan Mandiri'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/image/sipede login.png', height: 40),
                    const SizedBox(width: 5),
                    Image.asset('assets/image/sipedebawah.png', height: 40),
                  ],
                ),
                ElevatedButton(
                  // Tombol Riwayat
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayananMandiri()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Warna tombol
                    foregroundColor: Colors.white, // Warna teks tombol
                  ),
                  child: const Text('Riwayat'),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Ubah mainAxisAlignment
              children: [
                // Gabungkan teks dan gambar dalam Row
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem('Surat Pengantar', context, Colors.blue),
                _buildMenuItem('Surat Keterangan', context, Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, BuildContext context, Color tileColor) {
    return Card(
      // Bungkus ListTile dengan Card
      shape: RoundedRectangleBorder(
        // Berikan bentuk lonjong
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: tileColor,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {
          // Navigasi ke halaman pembuatan surat yang dipilih
          // Misalnya:
          if (title == 'Surat Pengantar') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BuatSuratPengantar()), // Ganti dengan halaman pembuatan surat SKTM
            );
          } else if (title == 'Surat Keterangan') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BuatSuratKeterangan()), // Ganti dengan halaman pembuatan surat SKD
            );
          } // ... tambahkan navigasi untuk surat lainnya
        },
      ),
    );
  }
}

// Contoh halaman pembuatan surat SKTM
class BuatSuratPengantar extends StatefulWidget {
  const BuatSuratPengantar({super.key});

  @override
  _BuatSuratPengantarState createState() => _BuatSuratPengantarState();
}

class _BuatSuratPengantarState extends State<BuatSuratPengantar> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSuratType; // To store selected surat type
  // XFile? _imageFile; // Untuk menyimpan gambar yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Surat Keterangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            child: Column(
              children: <Widget>[
                // Form untuk biodata
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Lengkap harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'jenis Kelamin harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Tempat tanggal lahir'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tempat Tanggal Lahir harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Status Perkawinan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status Perkawinan harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Kewarganegaraan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'kewarganegaraan harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Agama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Agama harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Pekerjaan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pekerjaan harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'NIK'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIK harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat harus diisi';
                    }
                    return null;
                  },
                ),
                // ... tambahkan field biodata lainnya
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Jenis Surat'),
                  value: _selectedSuratType,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSuratType = newValue;
                    });
                  },
                  items: <String>[
                    'Pengantar SKCK',
                    'Pengantar Izin Keramaian',
                    'Lainnya'
                  ] // Add your surat types here
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis Surat harus dipilih';
                    }
                    return null;
                  },
                ),
                // Tombol untuk scan dokumen
                ElevatedButton(
                  onPressed: () {
                    // _pickImage(); // Panggil fungsi untuk memilih gambar
                  },
                  child: const Text('Scan Dokumen'),
                ),

                // Tampilkan gambar yang dipilih (jika ada)
                // if (_imageFile != null)
                //   Image.file(File(_imageFile!.path)),

                // Tombol untuk submit form
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Aksi saat form valid, misal: kirim data ke server
                    }
                  },
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

// Halaman pembuatan surat keterangan
class BuatSuratKeterangan extends StatefulWidget {
  const BuatSuratKeterangan({super.key});

  @override
  _BuatSuratKeteranganState createState() => _BuatSuratKeteranganState();
}

class _BuatSuratKeteranganState extends State<BuatSuratKeterangan> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSuratType; // To store selected surat type
  // XFile? _imageFile; // Untuk menyimpan gambar yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Surat Keterangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            child: Column(
              children: <Widget>[
                // Form untuk biodata
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Lengkap harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'jenis Kelamin harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Tempat tanggal lahir'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tempat Tanggal Lahir harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Status Perkawinan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status Perkawinan harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Kewarganegaraan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'kewarganegaraan harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Agama'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Agama harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Pekerjaan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pekerjaan harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'NIK'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIK harus diisi';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat harus diisi';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Jenis Surat'),
                  value: _selectedSuratType,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSuratType = newValue;
                    });
                  },
                  items: <String>[
                    'Ketarangan Usaha',
                    'Keterangn KTP dalam proses',
                    'Keterangan Tempat berdomisili usaha',
                    'Ketarangan Pergi Kawin',
                    'Keterangn Penghasilan',
                    'Keterangan pengalihan JamKesda',
                    'Ketarangan Kurang Mampu',
                    'Keterangn Kelahlian',
                    'Keterangan Jual beli',
                    'Ketarangan Belum Kawin',
                    'Keterangn Beda identitas',
                    'Keterangan Berpergian'
                  ] // Add your surat types here
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis Surat harus dipilih';
                    }
                    return null;
                  },
                ),
                // Tombol untuk scan dokumen
                ElevatedButton(
                  onPressed: () {
                    // _pickImage(); // Panggil fungsi untuk memilih gambar
                  },
                  child: const Text('Scan Dokumen'),
                ),

                // Tampilkan gambar yang dipilih (jika ada)
                // if (_imageFile != null)
                //   Image.file(File(_imageFile!.path)),

                // Tombol untuk submit form
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Aksi saat form valid, misal: kirim data ke server
                    }
                  },
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
