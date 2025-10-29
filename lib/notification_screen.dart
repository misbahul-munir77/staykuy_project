import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          // Untuk saat ini, tombol kembali tidak akan berfungsi
          // karena ini adalah halaman pertama.
          // Nanti saat sudah ada navigasi, ini akan berfungsi otomatis.
          onPressed: () {},
        ),
        title: Text(
          'Notifikasi',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Hapus bayangan
        centerTitle: true,
      ),
      // Kita gunakan ListView agar daftar notifikasinya bisa di-scroll
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          // --- Bagian Hari Ini ---
          _NotificationSectionHeader(title: 'Hari Ini'),

          _NotificationItem(
            iconData: Icons.check_circle_outline, // Ikon centang
            iconBgColor: Colors.blue[50]!, // Warna latar ikon
            iconColor: Colors.blue[600]!, // Warna ikon
            title: 'Pemesanan berhasil',
            subtitle:
                'Anda telah memesan di Staykuy Tembung dari 10 - 12 Okt 2025',
            time: '12.19',
          ),

          _NotificationItem(
            iconData: Icons.campaign_outlined, // Ikon diskon/promo
            iconBgColor: Colors.indigo[50]!,
            iconColor: Colors.indigo[600]!,
            title: 'Diskon 10% Hari Ini',
            subtitle:
                'Hanya hari ini, diskon 10% untuk semua pemesanan. Dapatkan segera!',
            time: '10.25',
          ),

          _NotificationItem(
            iconData: Icons.local_offer_outlined, // Ikon tag harga/kedaluwarsa
            iconBgColor: Colors.red[50]!,
            iconColor: Colors.red[600]!,
            title: 'Kode Pembayaran Kedaluwarsa',
            subtitle:
                'Kode pembayaran Anda telah kedaluwarsa. Silakan melakukan pembayaran lagi!',
            time: '08.34',
          ),

          const SizedBox(height: 16), // Jarak antar bagian
          // --- Bagian Kemarin ---
          _NotificationSectionHeader(title: 'Kemarin'),

          _NotificationItem(
            iconData: Icons.chat_bubble_outline, // Ikon ulasan/chat
            iconBgColor: Colors.yellow[100]!,
            iconColor: Colors.yellow[800]!,
            title: 'Berikan Ulasan Anda',
            subtitle:
                'Mari bantu pengguna lain dengan meninggalkan ulasan Anda untuk Adiwana Suites.',
            time: '19.34',
          ),

          _NotificationItem(
            iconData: Icons.check_circle_outline,
            iconBgColor: Colors.blue[50]!,
            iconColor: Colors.blue[600]!,
            title: 'Pemesanan berhasil',
            subtitle:
                'Anda telah memesan di Staykuy Tembung dari 10 - 12 Okt 2025',
            time: '12.19',
          ),

          const SizedBox(height: 16), // Jarak antar bagian
          // --- Bagian Tanggal Sebelumnya ---
          _NotificationSectionHeader(title: '14 September 2024'),

          _NotificationItem(
            iconData: Icons.campaign_outlined,
            iconBgColor: Colors.indigo[50]!,
            iconColor: Colors.indigo[600]!,
            title: 'Diskon 10% Hari Ini',
            subtitle:
                'Hanya hari ini, diskon 10% untuk semua pemesanan. Dapatkan segera!',
            time: '10.25',
          ),

          _NotificationItem(
            iconData: Icons.local_offer_outlined,
            iconBgColor: Colors.red[50]!,
            iconColor: Colors.red[600]!,
            title: 'Kode Pembayaran Kedaluwarsa',
            subtitle:
                'Kode pembayaran Anda telah kedaluwarsa. Silakan melakukan pembayaran lagi!',
            time: '11.02',
          ),
        ],
      ),
    );
  }
}

/// WIDGET HELPER untuk judul bagian (cth: "Hari Ini")
class _NotificationSectionHeader extends StatelessWidget {
  final String title;
  const _NotificationSectionHeader({Key? key, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

/// WIDGET HELPER untuk setiap item notifikasi
class _NotificationItem extends StatelessWidget {
  final IconData iconData;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const _NotificationItem({
    Key? key,
    required this.iconData,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Ratakan ke atas
        children: [
          // Ikon di sebelah kiri
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10), // Sudut bulat
            ),
            child: Icon(iconData, color: iconColor, size: 24),
          ),

          const SizedBox(width: 16), // Jarak
          // Teks (Judul dan Subjudul) di tengah
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16), // Jarak
          // Waktu di sebelah kanan
          Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
        ],
      ),
    );
  }
}
