import 'package:flutter/material.dart';
// REVISI 1: Tambahkan import untuk forgot_password_screen.dart
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk mengelola input teks
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Definisi style untuk label (Email, Password)
    final labelStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    // Definisi style untuk border field input
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey[300]!),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar untuk judul "Masuk ke StayKuy"
      appBar: AppBar(
        title: Text(
          'Masuk ke StayKuy',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Hapus bayangan
        automaticallyImplyLeading: false, // Hapus tombol kembali
      ),
      // Gunakan SingleChildScrollView agar tidak error saat keyboard muncul
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Header Gambar Aset ---
            Image.asset(
              'assets/images/illustration.png',
              width: double.infinity, // Lebar penuh
              fit: BoxFit.cover, // Memastikan gambar menutupi area
            ),

            // --- Form Input ---
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label Email
                  Text('Email', style: labelStyle),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Masukan Email',
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.grey[600],
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder.copyWith(
                        borderSide: BorderSide(
                          color: Color(0xFF0095F6),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Label Password
                  Text('Password', style: labelStyle),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true, // Membuat teks jadi ••••••
                    decoration: InputDecoration(
                      hintText: 'Masukan Password',
                      // Ikon di desain adalah 'mail', bukan 'lock'
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.grey[600],
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder.copyWith(
                        borderSide: BorderSide(
                          color: Color(0xFF0095F6),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Link "Lupa Password?"
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      // REVISI 2: Ubah 'print' menjadi 'Navigator.push'
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Color(0xFF0095F6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- Tombol-Tombol ---

                  // Tombol "Lanjut"
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Tambahkan logika login
                        print('Email: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                      },
                      child: Text(
                        'Lanjut',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0095F6), // Biru
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tombol "Login Dengan Google"
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Tambahkan logika login Google
                        print('Login Google diklik');
                      },
                      icon: Image.asset(
                        'assets/images/google_logo.png', // Aset logo Google
                        height: 20.0,
                        // Jika Anda belum menambahkan logo Google, ini akan error
                        // Anda bisa menggantinya dengan Icon(Icons.google) sementara
                      ),
                      label: Text(
                        'Login Dengan Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // --- Footer Link Daftar ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigasi ke halaman daftar
                          print('Daftar diklik');
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF0095F6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
