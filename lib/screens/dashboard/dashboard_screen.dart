import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/profile_screen.dart';
import '../auth/riwayat_screen.dart';
import '../auth/tagihan_screen.dart';
import '../../routes/app_pages.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const _HomeScreen(),
    TagihanScreen(),
    RiwayatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B795E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B795E),
        leading: IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            Get.toNamed(Routes.NOTIFICATION);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: _screens[_selectedIndex],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Tagihan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          _buildProfileSection(),
          const SizedBox(height: 32),
          _buildServiceOptions(),
          const SizedBox(height: 40),
          _buildStatusCard(
            'Laundry Diproses',
            Icons.local_laundry_service,
            true,
          ),
          const SizedBox(height: 16),
          _buildStatusCard(
            'Laundry Sedang Diantar Ke Lokasi',
            Icons.delivery_dining,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(Icons.person, color: Colors.grey, size: 30),
        ),
        const SizedBox(width: 16),
        Text(
          'Welcome Budi',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceOptions() {
    return Row(
      children: [
        Expanded(
          child: _buildServiceCard(
            'per KG',
            Icons.layers,
            onTap: () => Get.toNamed(Routes.FRAGRANCE_SELECTION),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildServiceCard(
            'Satuan',
            Icons.shopping_basket_outlined,
            onTap: () => Get.toNamed(Routes.FRAGRANCE_SELECTION),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCard(String title, IconData icon, {required VoidCallback onTap}) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon, color: Colors.white, size: 48),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white.withOpacity(0.2)
            : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
