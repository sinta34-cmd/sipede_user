import 'package:flutter/material.dart';

class JumlahPendudukScreen extends StatelessWidget {
  final List<String> dusunList = [
    'Dusun Tegalan',
    'Dusun Midlanerejo',
    'Dusun Esparejo',
    'Dusun Roamharjo',
    'Dusun Junglerejo',
    'Dusun Padangbulan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumlah Penduduk'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dusunList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  dusunList[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                onTap: () {
                  Navigator.pushNamed(context, '/jumlah_penduduk_detail', arguments: dusunList[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
