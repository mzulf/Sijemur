import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B795E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B795E),
        title: const Text('Profil', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              'Budi',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildProfileOption('Pengaturan Profil', Icons.arrow_forward_ios, onTap: () {
                    Get.toNamed(Routes.PENGATURAN_PROFIL); // Navigasi ke Pengaturan Profil
                  }),
                  _buildProfileOption('Pengaturan Lokasi', Icons.arrow_forward_ios, onTap: () {
                    Get.toNamed(Routes.SET_LOKASI); // Navigasi ke Set Lokasi
                  }),
                  _buildProfileOption('Chat', Icons.arrow_forward_ios, onTap: () {
                    Get.toNamed(Routes.CHAT); // Navigasi ke Chat
                  }),
                  _buildProfileOption('Ulasan', Icons.arrow_forward_ios, onTap: () {
                    Get.toNamed(Routes.ULASAN); // Navigasi ke Ulasan
                  }),
                  _buildProfileOption('Keluar Akun', Icons.logout, isLogout: true, onTap: () {
                    _showLogoutDialog(); // Tampilkan dialog logout
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, IconData? icon, {bool isLogout = false, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isLogout ? Colors.red : Colors.black,
              ),
            ),
            if (icon != null) Icon(icon, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar akun?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Tutup dialog
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Tutup dialog
              _performLogout(); // Proses logout
            },
            child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _performLogout() {
    // Tambahkan logika logout Anda di sini
    Get.offAllNamed(Routes.WELCOME); // Navigasi ke halaman WelcomeScreen
  }
}
