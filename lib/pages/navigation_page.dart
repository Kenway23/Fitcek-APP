import 'package:flutter/material.dart';
import 'outfit_ai_page.dart';
import 'rekomendasi_page.dart';
import 'beranda_page.dart';
import 'profile_page.dart';
import 'about_page.dart';

class NavigationPage extends StatefulWidget {
  final Map<String, String> user; // data user dari login

  const NavigationPage({super.key, required this.user});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _index = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const BerandaPage(),
      const RekomendasiPage(),
      const OutfitAIPage(),
      ProfilePage(name: widget.user['name']!, email: widget.user['email']!),
      const AboutPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF12121A),
        selectedItemColor: const Color(0xFF6A5AE0),
        unselectedItemColor: Colors.white70,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Rekomendasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'Tanya AI',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
