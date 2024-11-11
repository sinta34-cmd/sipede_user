import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class JumlahPendudukScreen extends StatefulWidget {
  @override
  _JumlahPendudukScreenState createState() => _JumlahPendudukScreenState();
}

class _JumlahPendudukScreenState extends State<JumlahPendudukScreen> {
  final CollectionReference dusunCollection =
      FirebaseFirestore.instance.collection('dusunData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumlah Penduduk'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddDusunDialog(context),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dusunCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final dusunList = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: dusunList.length,
            itemBuilder: (context, index) {
              final dusunData = dusunList[index].data() as Map<String, dynamic>;
              final docId = dusunList[index].id;
              return ExpansionTile(
                title: Text(dusunData['namaDusun'] ?? 'Unknown'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          _showEditDusunDialog(context, dusunData, docId),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteDusun(docId),
                    ),
                  ],
                ),
                children: [
                  ListTile(
                    title: const Text('RT'),
                    subtitle: Text('${dusunData['jumlahRT'] ?? 0}'),
                  ),
                  ListTile(
                    title: const Text('RW'),
                    subtitle: Text('${dusunData['jumlahRW'] ?? 0}'),
                  ),
                  ListTile(
                    title: const Text('KK'),
                    subtitle: Text('${dusunData['jumlahKK'] ?? 0}'),
                  ),
                  ListTile(
                    title: const Text('Total Penduduk'),
                    subtitle: Text('${dusunData['totalPenduduk'] ?? 0}'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void _deleteDusun(String docId) {
    dusunCollection.doc(docId).delete();
  }

  void _showAddDusunDialog(BuildContext context) {
    String namaDusun = '';
    int jumlahRT = 0;
    int jumlahRW = 0;
    int jumlahKK = 0;
    int totalPenduduk = 0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Dusun'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nama Dusun'),
                onChanged: (value) => namaDusun = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Jumlah RT'),
                keyboardType: TextInputType.number,
                onChanged: (value) => jumlahRT = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Jumlah RW'),
                keyboardType: TextInputType.number,
                onChanged: (value) => jumlahRW = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Jumlah KK'),
                keyboardType: TextInputType.number,
                onChanged: (value) => jumlahKK = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Total Penduduk'),
                keyboardType: TextInputType.number,
                onChanged: (value) => totalPenduduk = int.tryParse(value) ?? 0,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                dusunCollection.add({
                  'namaDusun': namaDusun,
                  'jumlahRT': jumlahRT,
                  'jumlahRW': jumlahRW,
                  'jumlahKK': jumlahKK,
                  'totalPenduduk': totalPenduduk,
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDusunDialog(
      BuildContext context, Map<String, dynamic> dusunData, String docId) {
    String updatedName = dusunData['namaDusun'] ?? '';
    int updatedRT = dusunData['jumlahRT'] ?? 0;
    int updatedRW = dusunData['jumlahRW'] ?? 0;
    int updatedKK = dusunData['jumlahKK'] ?? 0;
    int updatedPenduduk = dusunData['totalPenduduk'] ?? 0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Dusun'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nama Dusun'),
                controller: TextEditingController(text: updatedName),
                onChanged: (value) => updatedName = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Jumlah RT'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: updatedRT.toString()),
                onChanged: (value) => updatedRT = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Jumlah RW'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: updatedRW.toString()),
                onChanged: (value) => updatedRW = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Jumlah KK'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: updatedKK.toString()),
                onChanged: (value) => updatedKK = int.tryParse(value) ?? 0,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Total Penduduk'),
                keyboardType: TextInputType.number,
                controller:
                    TextEditingController(text: updatedPenduduk.toString()),
                onChanged: (value) =>
                    updatedPenduduk = int.tryParse(value) ?? 0,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                dusunCollection.doc(docId).update({
                  'namaDusun': updatedName,
                  'jumlahRT': updatedRT,
                  'jumlahRW': updatedRW,
                  'jumlahKK': updatedKK,
                  'totalPenduduk': updatedPenduduk,
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
