import 'package:android_dev/Tugas_14/Views/post_list_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PostListScreenDay32();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Pendaftaran SQFlite',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostListScreenDay32(),
    );
  }
}
