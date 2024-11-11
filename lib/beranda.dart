import 'package:flutter/material.dart';
import 'package:myapp/aduan_desa.dart';
import 'package:myapp/dana_desa.dart';
import 'package:myapp/dokumen.dart';
import 'package:myapp/pengajuan_surat.dart';
import 'package:myapp/profil.dart';
import 'package:myapp/berita.dart';
import 'package:myapp/sidebar.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});
  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai!',
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  'Selamat datang di SiPede',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(
                    'Berita Desa Terkini',
                    const Color.fromARGB(255, 59, 167, 235),
                    context,
                    const Berita()),
                _buildMenuItem(
                    'Pengaduan Masyarakat',
                    const Color.fromARGB(255, 59, 167, 235),
                    context,
                    const AduanDesa()),
                _buildMenuItem(
                    'Dana Desa',
                    const Color.fromARGB(255, 59, 167, 235),
                    context,
                    const DanaDesa()),
                _buildMenuItem(
                    'Dokumen',
                    const Color.fromARGB(255, 59, 167, 235),
                    context,
                    const Dokumen()),
                _buildMenuItem(
                    'Layanan Mandiri',
                    const Color.fromARGB(255, 59, 167, 235),
                    context,
                    const PengajuanSurat()),
                _buildMenuItem(
                    'Perangkat Desa',
                    const Color.fromARGB(255, 59, 167, 235),
                    context,
                    const Profil()),
              ],
            ),
          ),
        ],
      ),
      drawer: const Sidebar(), // Sidebar attached to the Scaffold
    );
  }

  Widget _buildMenuItem(
    String title,
    Color color,
    BuildContext context,
    Widget halaman,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => halaman));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: color,
                ),
                child: const Text('Lihat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
