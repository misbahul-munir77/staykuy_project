import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // Import package 'pinput'
// REVISI 1: Tambahkan import untuk halaman password baru
import 'new_password_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tema untuk kotak Pinput
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(50),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Color(0xFF0095F6), width: 2),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Verifikasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              // Ikon Amplop
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF0095F6),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.mail_outline, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 24),
              // Judul
              Text(
                'Silahkan Verifikasi Email Anda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              // Subjudul
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  children: [
                    TextSpan(
                      text:
                          'Masukkan 5 digit kode yang kami kirimkan ke email anda\n',
                    ),
                    TextSpan(
                      text: widget.email,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Kotak Pinput (OTP)
              Pinput(
                controller: _pinController,
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: Colors.grey[100],
                  ),
                ),
                onCompleted: (pin) {
                  print('PIN Selesai: $pin');
                  // Pindah halaman saat PIN selesai diisi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              // Tombol "Verifikasi"
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  // REVISI 2: Ubah 'onPressed' untuk navigasi
                  onPressed: () {
                    print('Verifikasi kode: ${_pinController.text}');
                    // Pindah ke halaman password baru
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Verifikasi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0095F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Link "Kirim ulang"
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  children: [
                    TextSpan(text: 'Kode tidak terkirim? '),
                    TextSpan(
                      text: 'Klik di sini untuk mengirim ulang',
                      style: TextStyle(
                        color: Color(0xFF0095F6),
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
      ),
    );
  }
}
