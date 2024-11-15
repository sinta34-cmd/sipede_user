import 'package:flutter/material.dart';
import 'package:myapp/beranda.dart';
import 'package:myapp/dokumen.dart';
import 'package:myapp/layanan_mandiri.dart';
import 'package:myapp/pengajuan_surat.dart';
import 'package:myapp/rincian_surat.dart';
import 'package:myapp/splash_screen.dart';
import 'package:myapp/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
