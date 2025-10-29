import 'package:flutter/material.dart';

// Kita pakai StatefulWidget untuk 'mengingat' apakah password sedang
// ditampilkan atau disembunyikan.
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Controller untuk mengambil teks dari field
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Variabel 'bool' untuk melacak status tampilkan/sembunyikan
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    // Selalu 'dispose' controller Anda!
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
    );

    // Ini adalah style untuk border field
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey[400]!),
    );

    // Ini style border saat field-nya diklik
    final focusedInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFF0095F6), width: 2), // Warna biru
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Ganti Password',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Field Password Sekarang ---
            Text('Password Sekarang', style: labelStyle),
            const SizedBox(height: 8),
            TextFormField(
              controller: _currentPasswordController,
              // 'obscureText' membuat teks jadi ••••••
              obscureText: !_isCurrentPasswordVisible, // '!' membalik nilainya
              decoration: InputDecoration(
                hintText: '12345678', // Sesuai desain
                filled: true,
                fillColor: Colors.white,
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: focusedInputBorder,
                // Ini adalah ikon mata di sebelah kanan
                suffixIcon: IconButton(
                  icon: Icon(
                    // Logika untuk ganti ikon mata
                    _isCurrentPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    // 'setState' memberitahu Flutter untuk membangun ulang
                    // dengan nilai yang baru
                    setState(() {
                      _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Field Password Baru ---
            Text('Password Baru', style: labelStyle),
            const SizedBox(height: 8),
            TextFormField(
              controller: _newPasswordController,
              obscureText: !_isNewPasswordVisible,
              decoration: InputDecoration(
                hintText: '••••••••••',
                filled: true,
                fillColor: Colors.white,
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: focusedInputBorder,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isNewPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      _isNewPasswordVisible = !_isNewPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Field Konfirmasi Password Baru ---
            Text('Konfirmasi Password Baru', style: labelStyle),
            const SizedBox(height: 8),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                hintText: '••••••••••',
                filled: true,
                fillColor: Colors.white,
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: focusedInputBorder,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
            ),

            // Memberi jarak agar tombol tidak terlalu mepet
            const SizedBox(height: 40),

            // --- Tombol Terapkan ---
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika simpan password di sini
                  print('Password baru diterapkan!');
                  Navigator.of(context).pop(); // Kembali ke halaman profil
                },
                child: Text(
                  'Terapkan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0095F6), // Warna biru
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Sudut sesuai desain
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
