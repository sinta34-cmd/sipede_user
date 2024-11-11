import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/detail_dana2.dart';

class DanaDesa extends StatelessWidget {
  const DanaDesa({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dana Desa'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('danaDesa').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          final items = snapshot.data!.docs;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final itemId = item.id;
              final title = item['title'];

              return _buildMenuItem(
                title,
                const Color.fromARGB(255, 59, 167, 235),
                context,
                itemId,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMenuItem(
    String title,
    Color color,
    BuildContext context,
    String itemId,
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
                    context,
                    MaterialPageRoute(
                      builder: (context) => DanaDetailPage(
                        parentId: itemId,
                        parentTitle: title,
                      ),
                    ),
                  );
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

// DanaDetailPage for viewing sub-items
class DanaDetailPage extends StatelessWidget {
  final String parentId;
  final String parentTitle;

  const DanaDetailPage(
      {super.key, required this.parentId, required this.parentTitle});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title:
            Text(parentTitle), // Display the parentTitle as the app bar title
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            _firestore.collection('danaDesa/$parentId/subItems').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          final subItems = snapshot.data!.docs;

          return ListView.builder(
            itemCount: subItems.length,
            itemBuilder: (context, index) {
              final subItem = subItems[index];
              final subItemTitle = subItem['title'];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: const Color.fromARGB(255, 59, 167, 235),
                    child: ListTile(
                      title: Text(
                        subItemTitle,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailDanaDesa2(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
