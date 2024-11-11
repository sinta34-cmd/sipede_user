import 'package:flutter/material.dart';
import 'package:myapp/daftar.dart';
import 'package:myapp/welcome.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Logout",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      content: const SizedBox(
        height: 60,
        child: Column(
          children: [
            Divider(),
            Text("Apakah Anda yakin ingin keluar? "),
            Divider(),
          ],
        ),
      ),
      actions: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
              MaterialPageRoute(builder: (context) => const Daftar());
            print('Tombol Tidak Ditekan!');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              textStyle: const TextStyle(fontSize: 10),
              side: const BorderSide(color: Colors.grey, width: 1)),
          child: const Text(
            'TIDAK',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Welcome()),
              );
              print('Tombol Tidak Ditekan!');
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            child: const Text('YA',
                style: TextStyle(
                  color: Colors.white,
                ))),
      ],
    );
  }
}