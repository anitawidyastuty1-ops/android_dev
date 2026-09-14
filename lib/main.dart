import 'package:android_dev/latihandrawer.dart';
import 'package:android_dev/material.dart';
import 'package:android_dev/Latihandrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'contoh Bottom Navbar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Latihandrawer(), // Memanggil halaman navigasi utama
    ); // MaterialApp
  }
}
