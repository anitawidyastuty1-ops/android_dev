// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // int _selectedIndex = 0;
//   // static const List<Widget> _widgeOptions =

//   // Menu yang sedang aktif
//   String selectedMenu = 'Checkbox';

//   // =====================================================
//   // MEMBUAT BODY BERDASARKAN MENU
//   // =====================================================

//   // =====================================================
//   // MEMILIH MENU
//   // =====================================================

//   void selectMenu(String menu) {
//     setState(() {
//       selectedMenu = menu;
//     });
//   }

//   // =====================================================
//   // BUILD
//   // =====================================================

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(selectedMenu),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),

//       // Drawer
//       drawer: DrawerMenu(
//         selectedMenu: selectedMenu,
//         onMenuSelected: selectMenu,
//       ),

//       // Body
//       body: buildBody(),
//     );
//   }
// }

// //
