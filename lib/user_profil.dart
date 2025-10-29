// User_profil.dart

import 'package:flutter/material.dart';

// Ini adalah widget utama untuk layar profil Anda
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Kita gunakan warna latar belakang abu-abu muda, seperti di desain
      backgroundColor: Colors.grey[100],
      
      // AppBar untuk judul "information account"
      appBar: AppBar(
        title: Text(
          'information account',
          style: TextStyle(
            color: Colors.black, // Teks warna hitam
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        // Kita buat AppBar transparan dan tanpa bayangan
        backgroundColor: Colors.grey[100],
        elevation: 0,
        // Menonaktifkan tombol kembali otomatis (jika ada)
        automaticallyImplyLeading: false, 
      ),
      
      // Body utama dari layar
      body: SingleChildScrollView(
        // SingleChildScrollView memungkinkan layar untuk di-scroll
        // jika kontennya lebih panjang dari layar (misal di HP kecil)
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20), // Memberi jarak dari AppBar
              
              // --- Bagian Header Profil ---
              
              // Avatar (Gambar Profil)
              CircleAvatar(
                radius: 50, // Ukuran lingkaran
                // Anda bisa mengganti ini dengan gambar dari internet (NetworkImage)
                // atau dari aset lokal Anda (AssetImage)
                // Pastikan Anda menambahkan 'assets/images/profile_pic.jpg' ke file pubspec.yaml Anda
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                // Jika gambar gagal dimuat, tampilkan ikon orang
                onBackgroundImageError: (exception, stackTrace) => Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.grey[200],
              ),
              
              const SizedBox(height: 16), // Jarak
              
              // Nama Pengguna
              Text(
                'Freyanashifa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 4), // Jarak kecil
              
              // Lokasi Pengguna
              Text(
                'Jakarta, Indonesia',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600], // Warna abu-abu
                ),
              ),
              
              const SizedBox(height: 32), // Jarak besar sebelum menu
              
              // --- Bagian Daftar Menu ---
              // Kita akan membuat widget helper untuk ini agar kode tetap bersih
              
              ProfileMenuItem(
                icon: Icons.person_outline,
                text: 'Edit Profile',
                onTap: () {
                  // Tambahkan logika pindah halaman di sini
                  print('Edit Profile diklik');
                },
              ),
              
              ProfileMenuItem(
                icon: Icons.lock_outline,
                text: 'Change Password',
                onTap: () {
                  print('Change Password diklik');
                },
              ),
              
              ProfileMenuItem(
                icon: Icons.location_on_outline,
                text: 'My Location',
                onTap: () {
                  print('My Location diklik');
                },
              ),
              
              ProfileMenuItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {
                  // Tambahkan logika untuk logout di sini
                  print('Logout diklik');
                },
              ),
            ],
          ),
        ),
      ),
      
      // --- Bottom Navigation Bar Kustom ---
      // Ini adalah bagian yang paling menarik dari desain
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

/// WIDGET HELPER UNTUK ITEM MENU PROFIL
/// Membuat widget terpisah seperti ini membuat kode utama (di atas)
/// jauh lebih bersih dan mudah dibaca.
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Kita gunakan Container untuk membuat 'card'
    // dan InkWell untuk efek 'splash' saat diklik
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20), // Efek splash mengikuti bentuk
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8), // Jarak antar item
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white, // Warna kartu putih
          borderRadius: BorderRadius.circular(20), // Sudut yang sangat bulat
          boxShadow: [
            // Bayangan halus untuk efek 'mengambang'
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Ikon di sebelah kiri
            Icon(icon, color: Colors.grey[700], size: 28),
            const SizedBox(width: 16), // Jarak antara ikon dan teks
            // Teks
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Ikon panah di sebelah kanan
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 28),
          ],
        ),
      ),
    );
  }
}

/// WIDGET HELPER UNTUK BOTTOM NAVIGATION BAR KUSTOM
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ini adalah 'bar' putih di bagian bawah
    return Container(
      height: 80, // Tinggi bar, beri ruang untuk tombol bulat
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        // Membuat sudut atasnya melengkung
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        // Bayangan di atas bar
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2), // Bayangan hanya di atas
          ),
        ],
      ),
      // Row menampung semua 5 item navigasi
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Kita panggil 5 item, dan tandai 'Profile' sebagai 'isActive'
          BottomNavItem(
            icon: Icons.home_outlined,
            text: 'Home',
            isActive: false,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.explore_outlined,
            text: 'Explore',
            isActive: false,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.favorite_border,
            text: 'Favorite',
            isActive: false,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.history,
            text: 'History',
            isActive: false,
            onTap: () {},
          ),
          BottomNavItem(
            icon: Icons.person, // Ikon solid untuk yang aktif
            text: 'Profile',
            isActive: true, // Ini yang membedakannya
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

/// WIDGET HELPER UNTUK SETIAP ITEM DI BOTTOM NAV BAR
class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Warna biru yang kita lihat di desain
    final Color activeColor = Color(0xFF0D63F1); // Anda bisa ganti kodenya
    final Color inactiveColor = Colors.grey[600]!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20), // Efek splash
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Membuat Column sekecil mungkin
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logika utama:
            // JIKA 'isActive' adalah true, tampilkan lingkaran biru
            if (isActive)
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 26),
              )
            // JIKA false, tampilkan ikon biasa
            else
              Icon(icon, color: inactiveColor, size: 26),
            
            const SizedBox(height: 4), // Jarak antara ikon dan teks
            
            // Teks di bawah ikon
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? activeColor : inactiveColor,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
