import 'package:flutter/material.dart';

class LatihanBottomNavigator extends StatefulWidget {
  const LatihanBottomNavigator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LatihanBottomNavigatorState createState() => _LatihanBottomNavigatorState();
}

class LatihanBottomNavigatorState {}

class _LatihanBottomNavigatorState extends State<LatihanBottomNavigator> {
  // 1. variabel untuk menyimpan indeks halaman yang aktif saat ini
  int _currentIndex = 0;

  // 2. Daftar halaman (widget) yang akan ditampilkan sesuai indeks
  final List<Widget> _pages = [
    const Center(
      child: Text('Halaman beranda 1', style: TextStyle(fontSize: 24)),
    ),
    const Center(child: Text('Halaman cari 2', style: TextStyle(fontSize: 24))),
    const Center(
      child: Text('Halaman Profil 3', style: TextStyle(fontSize: 24)),
    ),
  ];

  //  3. fungsi untuk mengubah indeks ketika item  navbar ditekan
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Bottom Navigator'),
        backgroundColor: Colors.amber,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
