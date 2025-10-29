import 'package:flutter/material.dart';

// Ini adalah widget utama untuk layar profil Anda
class ProfileScreen extends StatelessWidget {
  // PERBAIKAN: Menggunakan 'super.key' (fitur Dart 3)
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'information account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // --- Bagian Header Profil ---
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                onBackgroundImageError: (exception, stackTrace) => Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.grey[200],
              ),
              
              const SizedBox(height: 16),
              
              Text(
                'Freyanashifa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 4),
              
              Text(
                'Jakarta, Indonesia',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // --- Bagian Daftar Menu ---
              
              ProfileMenuItem(
                icon: Icons.person_outline,
                text: 'Edit Profile',
                onTap: () {
                  // Kita biarkan 'print' untuk debugging
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
                // PERBAIKAN: Mengganti 'location_on_outline' menjadi 'location_on_outlined'
                icon: Icons.location_on_outlined, 
                text: 'My Location',
                onTap: () {
                  print('My Location diklik');
                },
              ),
              
              ProfileMenuItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {
                  print('Logout diklik');
                },
              ),
            ],
          ),
        ),
      ),
      
      // --- Bottom Navigation Bar Kustom ---
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

/// WIDGET HELPER UNTUK ITEM MENU PROFIL
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({
    // PERBAIKAN: Menggunakan 'super.key'
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // PERBAIKAN: Mengganti '.withOpacity(0.05)' menjadi '.withAlpha(13)'
              color: Colors.black.withAlpha(13), 
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[700], size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 28),
          ],
        ),
      ),
    );
  }
}

/// WIDGET HELPER UNTUK BOTTOM NAVIGATION BAR KUSTOM
class CustomBottomNavBar extends StatelessWidget {
  // PERBAIKAN: Menggunakan 'super.key'
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            // PERBAIKAN: Mengganti '.withOpacity(0.1)' menjadi '.withAlpha(26)'
            color: Colors.black.withAlpha(26), 
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
            icon: Icons.person,
            text: 'Profile',
            isActive: true,
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
    // PERBAIKAN: Menggunakan 'super.key'
    super.key,
    required this.icon,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Color(0xFF0D63F1);
    final Color inactiveColor = Colors.grey[600]!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isActive)
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 26),
              )
            else
              Icon(icon, color: inactiveColor, size: 26),
            
            const SizedBox(height: 4),
            
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
