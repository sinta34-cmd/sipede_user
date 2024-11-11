 import 'package:flutter/material.dart';
import 'package:myapp/daftar.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/masuk.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Spacer(flex: 1), // 1/8 bagian atas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                  child: Text(
                    'Selamat Datang di ',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Image.asset('assets/image/logo nama sipede 1.png', height: 40),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/image/sipede login.png', height: 180),
            ),
            const Spacer(flex: 5), // 5/8 bagian tengah
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Masuk()),
                );
                print('Tombol Mulai ditekan!');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              child: const Text('MASUK', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Daftar()),
                );
                print('Tombol Daftar ditekan!');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              child: const Text('DAFTAR',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            const Spacer(flex: 6), // 1/8 bagian bawah
          ],
        ),
      ),
    );
  }
}
