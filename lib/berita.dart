import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});

  @override
  State<Berita> createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  final CollectionReference _beritaCollection =
      FirebaseFirestore.instance.collection('berita'); // Firestore collection reference

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
                  'Berita',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: _beritaCollection.snapshots(), // Firestore stream
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading data'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No news available'));
                  }

                  final List<DocumentSnapshot> beritaDocs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: beritaDocs.length,
                    itemBuilder: (context, index) {
                      var beritaData = beritaDocs[index];
                      return _MenuBerita(
                        title: beritaData['title'] ?? 'No Title',
                        details: beritaData['details'] ?? 'No Details',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuBerita extends StatefulWidget {
  final String title;
  final String details;

  const _MenuBerita({
    required this.title,
    required this.details,
  });

  @override
  State<_MenuBerita> createState() => _MenuBeritaState();
}

class _MenuBeritaState extends State<_MenuBerita> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
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
          setState(() {
            _showDetails = !_showDetails;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              if (!_showDetails)
                const Text(
                  'Jadwal pelaksanaan... baca selengkapnya',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              else
                Text(
                  widget.details,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
