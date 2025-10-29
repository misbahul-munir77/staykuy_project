// PERBAIKAN: Tambahkan baris ini
import 'package:flutter/material.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Latar belakang abu-abu "di luar" kartu
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // Desain Anda memiliki judul 'Verifikasi'
        title: Text(
          'Verifikasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        // Kita sembunyikan tombol kembali di halaman sukses
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Expanded membuat 'kartu' ini mengisi sisa layar
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Pusatkan konten
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 1. Ikon Centang Biru
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFF0095F6), // Biru
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check, color: Colors.white, size: 40),
                    ),
                    const SizedBox(height: 24),

                    // 2. Judul
                    Text(
                      'Password Diganti!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 3. Subjudul
                    Text(
                      'Password anda sukses diperbarui.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 32),

                    // 4. Ilustrasi Aset
                    Image.asset(
                      'assets/images/password_success_illustration.png',
                      height: 250, // Sesuaikan tinggi gambar
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 32),

                    // 5. Tombol "Kembali ke Login"
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Kembali ke halaman paling awal (Login)
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                        },
                        child: Text(
                          'Kembali ke Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0095F6), // Biru
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50.0,
                            ), // Sangat bulat
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 6. Teks Catatan
                    Text(
                      'Silahkan simpan password anda dengan baik. Catat apabila perlu.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
