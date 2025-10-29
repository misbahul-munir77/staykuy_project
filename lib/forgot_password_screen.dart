import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// REVISI 1: Tambahkan import untuk halaman verifikasi
import 'verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Definisi style untuk border field input
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF0095F6), width: 1.5),
      borderRadius: BorderRadius.circular(50.0), // Sangat bulat
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Lupa Password',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Ilustrasi Aset
            Image.asset(
              'assets/images/forgot_password_illustration.png',
              height: 250, // Sesuaikan ukuran gambar
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),

            // 2. Judul
            Text(
              'Lupa Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            // 3. Subjudul/Deskripsi
            Text(
              'Silahkan masukkan alamat email anda di bawah agar kami bisa merecover akun anda',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 32),

            // 4. Form Email
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email anda',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'fatihmumtazah@gmail.com',
                prefixIcon: Icon(Icons.mail_outline, color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: inputBorder.copyWith(
                  borderSide: BorderSide(color: Color(0xFF0095F6), width: 2.5),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // 5. Tombol "Kirimkan Kode"
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                // REVISI 2: Ubah 'print' menjadi 'Navigator.push'
                onPressed: () {
                  // Kirim email ke halaman verifikasi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(
                        // Mengoper email yang diketik pengguna
                        email: _emailController.text,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Kirimkan Kode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0095F6), // Biru
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0), // Sangat bulat
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 6. Link "Kirim ulang"
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                children: [
                  TextSpan(text: 'Kode tidak terkirim? '),
                  TextSpan(
                    text: 'Klik di sini untuk mengirim ulang',
                    style: TextStyle(
                      color: Color(0xFF0095F6), // Biru
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Kirim ulang kode diklik');
                      },
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
