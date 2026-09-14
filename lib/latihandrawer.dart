import 'package:flutter/material.dart';

import 'package:latihandrawer.dart';

class Latihandrawer extends StatefulWidget {
  const Latihandrawer({super.key});

  @override
  Latihandrawerstate createState() => Latihandrawerstate();
}

class Latihandrawerstate extends State<Latihandrawer> {
  // Indeks halaman aktif saat ini
  int _selectedIndex = 0;

  //Daftar judul untuk AppBar berdasarkan halaman aktif
  final List<String> _titles = ['Halaman Circle Avatar', 'Halaman Grid View'];

  //Daftar widget halaman tujuan
  final List<Widget> _Pages = [
    const LatihanCircleavatar(),
    const latihanGridview(),
  ];

  // Fungsi untuk mengubah halaman aktif
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.blue,
      ), //AppBar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Budi Setiawan"),
              accountEmail: Text("budi.setiawan@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "B",
                  style: TextStyle(fontSize: 40.0, color: Colors.blue),
                ), //Text(
              ), //CircleAvatar
              decoration: BoxDecoration(color: Colors.blue),
            ), //UserAccountsDrawerHeader
            // Menu 1: Beranda
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Latihan Icon Avatar'),
              selected: _selectedIndex == 0, //highlight jika menu ini aktif
              onTap: () {
                _onItemTapped(0); //Pindah ke indeks 0
                Navigator.pop(context); // Menutup Drawer setelah diklik
              },
            ), //LisTile
            // Menu 2: Pengaturan
            ListTile(
              leading: const Icon(Icons.abc_sharp),
              selected: _selectedIndex == 1, // Highlight jika menu ini aktif
              onTap: () {
                _onItemTapped(1); // Pindah ke indeks 1
                Navigator.pop(context); // Menutup Drawer setelah diklik
              },
            ), // LisTile
          ],
        ), //ListView
      ), // Drawer
      body: Pages(_selectedIndex),
    );
  }
}
