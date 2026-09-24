// import 'package:android_dev/tugas-12/database_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:android_dev/tugas-12/registration_screen.dart';
// import 'package:android_dev/models/user_login.dart';
// import 'package:sqflite/sqflite.dart';

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({super.key});

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final _formKey = GlobalKey<FormState>();

//   // Controller
//   final TextEditingController namaController = TextEditingController();

//   final TextEditingController emailController = TextEditingController();

//   final TextEditingController noHpController = TextEditingController();

//   final TextEditingController passwordController = TextEditingController();

//   final TextEditingController kotaController = TextEditingController();

//   bool isLoading = false;

//   // Menyimpan data
//   Future<void> _simpanData() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     setState(() {
//       isLoading = true;
//     });

//     final User = User(
//       nama: namaController.text.trim(),
//       email: emailController.text.trim(),
//       noHp: noHpController.text.trim(),
//       password: passwordController.text,
//       asalKota: kotaController.text.trim(),
//     );

//     await DatabaseHelper.instance.insertUser(user);

//     // Bersihkan form
//     namaController.clear();
//     emailController.clear();
//     noHpController.clear();
//     passwordController.clear();
//     kotaController.clear();

//     setState(() {
//       isLoading = false;
//     });

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Data berhasil disimpan ke database')),
//       );

//       // Memaksa FutureBuilder mengambil data terbaru
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     namaController.dispose();
//     emailController.dispose();
//     noHpController.dispose();
//     passwordController.dispose();
//     kotaController.dispose();

//     super.dispose();
//   }

//   // Widget TextFormField
//   Widget _inputField({
//     required String label,
//     required String hint,
//     required TextEditingController controller,
//     required IconData icon,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           labelText: label,
//           hintText: hint,
//           prefixIcon: Icon(icon),
//           border: const OutlineInputBorder(),
//         ),
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return '$label wajib diisi';
//           }

//           if (label == 'Email') {
//             if (!value.contains('@')) {
//               return 'Email tidak valid';
//             }
//           }

//           if (label == 'Nomor HP') {
//             if (value.length < 10) {
//               return 'Nomor HP minimal 10 digit';
//             }
//           }

//           if (label == 'Password') {
//             if (value.length < 6) {
//               return 'Password minimal 6 karakter';
//             }
//           }

//           return null;
//         },
//       ),
//     );
//   }

//   // Form pendaftaran
//   Widget _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           _inputField(
//             label: 'Nama',
//             hint: 'Masukkan nama lengkap',
//             controller: namaController,
//             icon: Icons.person,
//           ),

//           _inputField(
//             label: 'Email',
//             hint: 'Masukkan email',
//             controller: emailController,
//             icon: Icons.email,
//             keyboardType: TextInputType.emailAddress,
//           ),

//           _inputField(
//             label: 'Nomor HP',
//             hint: 'Masukkan nomor HP',
//             controller: noHpController,
//             icon: Icons.phone,
//             keyboardType: TextInputType.phone,
//           ),

//           _inputField(
//             label: 'Password',
//             hint: 'Masukkan password',
//             controller: passwordController,
//             icon: Icons.lock,
//             obscureText: true,
//           ),

//           _inputField(
//             label: 'Asal Kota',
//             hint: 'Masukkan asal kota',
//             controller: kotaController,
//             icon: Icons.location_city,
//           ),

//           const SizedBox(height: 5),

//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton.icon(
//               onPressed: isLoading ? null : _simpanData,
//               icon: const Icon(Icons.save),
//               label: Text(isLoading ? 'Menyimpan...' : 'Daftar'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // List peserta
//   Widget _buildList() {
//     return FutureBuilder<List<User>>(
//       future: DatabaseHelper.instance.getUsers(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
//         }

//         final users = snapshot.data ?? [];

//         if (users.isEmpty) {
//           return const Center(child: Text('Belum ada peserta yang terdaftar.'));
//         }

//         return ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context, index) {
//             final user = users[index];

//             return Card(
//               margin: const EdgeInsets.only(bottom: 10),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   child: Text(
//                     user.nama.isNotEmpty ? user.nama[0].toUpperCase() : '?',
//                   ),
//                 ),
//                 title: Text(
//                   user.nama,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Email: ${user.email}'),
//                     Text('No HP: ${user.noHp}'),
//                     Text('Asal Kota: ${user.asalKota}'),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pendaftaran Peserta'),
//         centerTitle: true,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Form Pendaftaran',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 15),

//             _buildForm(),

//             const SizedBox(height: 25),

//             const Text(
//               'Daftar Peserta',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),

//             const SizedBox(height: 10),

//             Expanded(child: _buildList()),
//           ],
//         ),
//       ),
//     );
//   }
// }
