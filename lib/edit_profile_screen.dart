// PERBAIKAN: Baris ini yang hilang!
import 'package:flutter/material.dart';

// Kita menggunakan StatefulWidget karena kita perlu 'mengingat'
// data yang diinput oleh pengguna di dalam text fields.
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Ini adalah 'controller' yang akan menyimpan dan mengelola
  // teks yang Anda ketik.
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  // Ini untuk melacak nilai dropdown 'Jenis Kelamin'
  String _selectedGender = 'Female';

  @override
  void initState() {
    super.initState();
    // Kita inisialisasi controller dengan nilai awal dari desain
    _nameController = TextEditingController(text: 'freyanashifa');
    _usernameController = TextEditingController(text: 'freyanashifa02');
    _phoneController = TextEditingController(text: '82153972754');
    _emailController = TextEditingController(text: 'freyanashifa02@gmail.com');
  }

  @override
  void dispose() {
    // PENTING! Kita harus 'membuang' controller saat
    // halaman ditutup untuk menghindari kebocoran memori.
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Kita definisikan style di sini agar mudah digunakan ulang
    final labelStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
    );

    // Ini adalah dekorasi untuk field input kita
    final inputDecoration = (String hint) => InputDecoration(
      // 'hintText' adalah teks abu-abu yang hilang saat Anda mulai mengetik
      hintText: hint,
      // 'filled: true' & 'fillColor' memberi latar belakang abu-abu muda
      filled: true,
      fillColor: Colors.grey[50],
      // Ini adalah border default (saat tidak diklik)
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      // Ini adalah border saat Anda mengklik/mengetik di field
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Color(0xFF0095F6),
          width: 2,
        ), // Warna biru
      ),
      // Mengatur padding di dalam field
      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    );

    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      appBar: AppBar(
        // Tombol kembali (otomatis ditambahkan oleh Navigator)
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Fungsi untuk kembali ke halaman sebelumnya
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Edit Profil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Menghilangkan bayangan AppBar
      ),
      // Kita gunakan SingleChildScrollView agar halaman bisa di-scroll
      // jika keyboard muncul dan menutupi field
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0), // Padding di sekeliling halaman
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Ratakan semua ke kiri
          children: [
            // --- Bagian Avatar ---
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/profile_pic.jpg',
                    ),
                    backgroundColor: Colors.grey[200],
                  ),
                  // Tombol ikon kamera
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF0095F6), // Biru
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- Form Input ---

            // Field Nama
            Text('Nama', style: labelStyle),
            const SizedBox(height: 8),
            TextFormField(
              controller: _nameController, // Hubungkan controller
              decoration: inputDecoration('Masukkan nama Anda'),
            ),
            const SizedBox(height: 16),

            // Field Username
            Text('Username', style: labelStyle),
            const SizedBox(height: 8),
            TextFormField(
              controller: _usernameController,
              decoration: inputDecoration('Masukkan username Anda'),
            ),
            const SizedBox(height: 16),

            // Field Jenis Kelamin (Dropdown)
            Text('Jenis Kelamin', style: labelStyle),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedGender, // Nilai yang terpilih
              items:
                  ['Female', 'Male', 'Other'] // Pilihan yang ada
                      .map(
                        (label) =>
                            DropdownMenuItem(child: Text(label), value: label),
                      )
                      .toList(),
              onChanged: (value) {
                // Saat pengguna memilih, update nilainya
                setState(() {
                  _selectedGender = value!;
                });
              },
              decoration: inputDecoration(''),
            ),
            const SizedBox(height: 16),

            // Field Nomor Ponsel
            Text('Nomor Ponsel', style: labelStyle),
            const SizedBox(height: 8),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone, // Tampilkan keyboard angka
              decoration: inputDecoration('812...').copyWith(
                // 'prefixIcon' untuk menambahkan '+62'
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('+62', style: TextStyle(fontSize: 16)),
                      Icon(Icons.arrow_drop_down, color: Colors.grey[700]),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Field Email
            Text('Email', style: labelStyle),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              keyboardType:
                  TextInputType.emailAddress, // Tampilkan keyboard email
              decoration: inputDecoration('email@anda.com'),
            ),
            const SizedBox(height: 32),

            // --- Tombol Terapkan ---
            SizedBox(
              width: double.infinity, // Buat tombol selebar layar
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika penyimpanan data di sini
                  print('Data disimpan!');
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
                  backgroundColor: Color(0xFF0095F6), // Warna tombol biru
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Sudut bulat
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
