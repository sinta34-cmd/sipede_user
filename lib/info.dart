import 'package:flutter/material.dart';


class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          const Divider(), // Garis pemisah
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang SiPede'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi ketika menu "Tentang" ditekan
              // Misalnya, navigasi ke halaman detail tentang
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Fitur'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi ketika menu "Fitur" ditekan
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.thumb_up),
            title: const Text('Keunggulan SiPeDe'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi ketika menu "Keunggulan" ditekan
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Team SiPeDe'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi ketika menu "Team" ditekan
            },
          ),
        ],
      ),
    );
  }
}
