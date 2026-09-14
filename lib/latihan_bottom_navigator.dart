import 'package:flutter/material.dart';

class latihan_bottom_navigator extends StatefulWidget{
  const latihan_bottom_navigator ({super.key});

  @override
  latihan_bottom_navigatorState createState() => latihan_bottom_navigator();
}

class latihan_bottom_navigatorState extends State<latihan_bottom_navigator> {
  //1. variabel untuk menyimpan indeks halaman yang aktif saat ini
  int _cuttentIndex = 0;

  //2. Daftar halaman (widget) yang akan ditampilkan sesuai indeks
  final List<Widget> _Pages = [
    const Center(
      child: Text('Halaman Beranda 1', style: TextStyle(fontSize: 24)), 
    ),
    const Center(child: Text('Halaman cari 2', style: TextStyle(fontSize: 24))),
    const Center(
      child: Text('Halaman Profil 3', TextStyle:(fontsize: 24)),
    ), 
  ];

  //3. Fungsi untuk mengubah indeks ketika item navbar ditekan
  Void onTap(int index) {
    setState(() {
      currentIndex = index) {
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Bottom Navigator'),
        backgroundColor: Colors.amber,
      ),//AppBar
      body: Pages(_cuttentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Indeks aktif saat ini
        onTap: onTap, // Fungsi aksi saat tab ditekan
        items: const [
          BottomNavigationBarItem(icon: icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: icon(Icons.search), label: 'cari'),
          BottomNavigationBarItem(icon: icon(Icons.person, label: 'Profil'),
        ],
      ),// BottomNavigatorBar
  ),// Scaffold,
};
}  