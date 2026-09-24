// import 'package:flutter/lib/toko/tugas_9.dart';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// // ======================================================
// // 1. DATA LIST SEDERHANA
// // ======================================================

// final List<String> kategoriList = [
//   'Headphone'
//   'Handphone'
//   'Elektronik',
//   'Pakaian Pria',
//   'Pakaian Wanita',
//   'Alat Tulis Kantor',
//   'Buku',
//   'Peralatan Dapur',
//   'Makanan Ringan',
//   'Minuman',
// ];

// // ======================================================
// // 2. DATA LIST<Map<String, dynamic>>
// // ======================================================

// final List<Map<String, dynamic>> kategoriMap = [
//   {
//     'nama': 'Headphone'
//     'icon': Icons.headphone,
//     'deskripsi': 'Headphone.',
//   },
//   {
//     'nama': 'Handphone'
//     'icon': Icons.hp,
//     'deskripsi': 'Handphone.',
//   },
//   {
//     'nama': 'Elektronik',
//     'icon': Icons.devices,
//     'deskripsi': 'Peralatan elektronik rumah tangga.',
//   },
//   {
//     'nama': 'Pakaian Pria',
//     'icon': Icons.man,
//     'deskripsi': 'Berbagai pakaian untuk pria.',
//   },
//   {
//     'nama': 'Pakaian Wanita',
//     'icon': Icons.woman,
//     'deskripsi': 'Berbagai pakaian untuk wanita.',
//   },
//   {
//     'nama': 'Alat Tulis Kantor',
//     'icon': Icons.alattuliskantor,
//     'deskripsi': 'Perlengkapan untuk sekolah dan kantor.',
//   },
//   {
//     'nama': 'Buku & Majalah',
//     'icon': Icons.menu_book,
//     'deskripsi': 'Buku, majalah, dan bahan bacaan.',
//   },
//   {
//     'nama': 'Peralatan Dapur',
//     'icon': Icons.kitchen,
//     'deskripsi': 'Peralatan untuk kebutuhan dapur.',
//   },
//   {
//     'nama': 'Makanan Ringan',
//     'icon': Icons.snacks,
//     'deskripsi': 'Aneka makanan ringan dan camilan.',
//   },
//   {
//     'nama': 'Minuman',
//     'icon': Icons.local_drink,
//     'deskripsi': 'Berbagai jenis minuman.',
//   },
// ];

// // ======================================================
// // 3. MODEL PRODUK
// // ======================================================

// class Produk {
//   final String nama;
//   final String kategori;
//   final String deskripsi;
//   final String gambar;
//   final double harga;

//   Produk({
//     required this.nama,
//     required this.kategori,
//     required this.deskripsi,
//     required this.gambar,
//     required this.harga,
//   });
// }

// // Data produk menggunakan Model
// final List<Produk> produkList = [
//   Produk(
//     nama: 'headphone',
//     kategori: 'Buah-buahan',
//     deskripsi: 'Apel Fuji segar dan manis.',
//     gambar: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6',
//     harga: 15000,
//   ),
//   Produk(
//     nama: 'Wortel Segar',
//     kategori: 'Sayuran',
//     deskripsi: 'Wortel segar kaya akan vitamin.',
//     gambar: 'https://images.unsplash.com/photo-1445282768818-728615cc910a',
//     harga: 10000,
//   ),
//   Produk(
//     nama: 'Headphone Bluetooth',
//     kategori: 'Elektronik',
//     deskripsi: 'Headphone wireless dengan kualitas suara jernih.',
//     gambar: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
//     harga: 250000,
//   ),
//   Produk(
//     nama: 'Kemeja Pria',
//     kategori: 'Pakaian Pria',
//     deskripsi: 'Kemeja pria berbahan nyaman untuk sehari-hari.',
//     gambar: 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf',
//     harga: 150000,
//   ),
//   Produk(
//     nama: 'Dress Wanita',
//     kategori: 'Pakaian Wanita',
//     deskripsi: 'Dress wanita dengan desain modern.',
//     gambar: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8',
//     harga: 200000,
//   ),
//   Produk(
//     nama: 'Buku Catatan',
//     kategori: 'Alat Tulis Kantor',
//     deskripsi: 'Buku catatan untuk sekolah dan pekerjaan.',
//     gambar: 'https://images.unsplash.com/photo-1544816155-12df9643f363',
//     harga: 25000,
//   ),
//   Produk(
//     nama: 'Novel Petualangan',
//     kategori: 'Buku & Majalah',
//     deskripsi: 'Novel menarik untuk menemani waktu santai.',
//     gambar: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f',
//     harga: 75000,
//   ),
//   Produk(
//     nama: 'Set Peralatan Dapur',
//     kategori: 'Peralatan Dapur',
//     deskripsi: 'Peralatan dapur lengkap untuk memasak.',
//     gambar: 'https://images.unsplash.com/photo-1556911220-bff31c812dba',
//     harga: 350000,
//   ),
//   Produk(
//     nama: 'Keripik Kentang',
//     kategori: 'Makanan Ringan',
//     deskripsi: 'Keripik kentang renyah dan gurih.',
//     gambar: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b',
//     harga: 12000,
//   ),
//   Produk(
//     nama: 'Jus Jeruk',
//     kategori: 'Minuman',
//     deskripsi: 'Minuman jus jeruk segar dan menyegarkan.',
//     gambar: 'https://images.unsplash.com/photo-1600271886742-f049cd451bba',
//     harga: 15000,
//   ),
// ];

// // ======================================================
// // MAIN APP
// // ======================================================

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Kategori Produk',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//         ),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// // ======================================================
// // HOME PAGE
// // ======================================================

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Kategori Produk'),
//           centerTitle: true,
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.list),
//                 text: 'List',
//               ),
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Map',
//               ),
//               Tab(
//                 icon: Icon(Icons.shopping_bag),
//                 text: 'Model',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             HalamanList(),
//             HalamanMap(),
//             HalamanModel(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ======================================================
// // HALAMAN 1 - LIST
// // ======================================================

// class HalamanList extends StatelessWidget {
//   const HalamanList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(10),
//       itemCount: kategoriList.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             title: Text(
//               kategoriList[index],
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // ======================================================
// // HALAMAN 2 - LIST<Map<String, dynamic>>
// // ======================================================

// class HalamanMap extends StatelessWidget {
//   const HalamanMap({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(10),
//       itemCount: kategoriMap.length,
//       itemBuilder: (context, index) {
//         final kategori = kategoriMap[index];

//         return Card(
//           child: ListTile(
//             leading: CircleAvatar(
//               child: Icon(kategori['icon']),
//             ),
//             title: Text(
//               kategori['nama'],
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: Text(
//               kategori['deskripsi'],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // ======================================================
// // HALAMAN 3 - MODEL
// // ======================================================

// class HalamanModel extends StatelessWidget {
//   const HalamanModel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(10),
//       itemCount: produkList.length,
//       itemBuilder: (context, index) {
//         return ListProduk(
//           produk: produkList[index],
//         );
//       },
//     );
//   }
// }

// // ======================================================
// // WIDGET PRODUK
// // ======================================================

// class ListProduk extends StatelessWidget {
//   final Produk produk;

//   const ListProduk({
//     super.key,
//     required this.produk,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 180,
//             width: double.infinity,
//             child: Image.network(
//               produk.gambar,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return const Center(
//                   child: Icon(
//                     Icons.image_not_supported,
//                     size: 60,
//                   ),
//                 );
//               },
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   produk.nama,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 5),

//                 Text(
//                   produk.kategori,
//                   style: TextStyle(
//                     color: Theme.of(context)
//                         .colorScheme
//                         .primary,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 Text(
//                   produk.deskripsi,
//                   style: const TextStyle(
//                     fontSize: 14,
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 Text(
//                   'Rp ${produk.harga.toStringAsFixed(0)}',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
