// PERBAIKAN: Baris ini yang hilang!
import 'package:flutter/material.dart';

// 1. REVISI: Ubah import ke login_screen.dart
import 'login_screen.dart';

void main() {
  runApp(const StayKuyApp());
}

class StayKuyApp extends StatelessWidget {
  const StayKuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StayKuy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Font yang konsisten
      ),

      // 2. REVISI UTAMA:
      // Kita ganti 'home' menjadi 'LoginScreen'
      home: const LoginScreen(),

      // Sembunyikan banner 'DEBUG'
      debugShowCheckedModeBanner: false,
    );
  }
}
