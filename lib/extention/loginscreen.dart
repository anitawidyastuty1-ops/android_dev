// import 'package:android_dev/Day_17/db_helper.dart';
// import 'package:android_dev/day_15_services/preference_handler.dart';
// import 'package:android_dev/day_15_services/splash_screen.dart';
// import 'package:android_dev/extention/navigator.dart';
// import 'package:android_dev/models/user_login.dart';
// import 'package:flutter/material.dart';

// class LoginScreenDay15 extends StatefulWidget {
//   const LoginScreenDay15({super.key});

//   @override
//   State<LoginScreenDay15> createState() => _LoginScreenDay15State();
// }

// class _LoginScreenDay15State extends State<LoginScreenDay15> {
//   final _formKey = GlobalKey<FormState>();

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void register() async {
//     final user = emailController.text.trim();
//     final pass = passwordController.text;

//     if (user.isEmpty || pass.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Isi semua field!')));
//       return;
//     }

//     final pengguna = UserModelSQL(email: user, password: pass);

//     bool success = await DBHelper().registerUser(pengguna);

//     if (!mounted) return; // Menghindari linter warning: 'Don't use BuildContext across async gaps'

//     if (success) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
//     }
//   }

//   void login() async {
//     final user = emailController.text.trim();
//     final pass = passwordController.text;

//     if (user.isEmpty || pass.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Isi semua field!')));
//       return;
//     }

//     final pengguna = await DBHelper().loginUser(user, pass);

//     if (!mounted) return; // Menghindari linter warning penggunaan BuildContext

//     if (pengguna != null) {
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => home_Screen()),
//         (route) => false,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Login gagal! email atau Password salah.'),
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.lock, size: 80, color: Colors.blue),

//                     const SizedBox(height: 24),

//                     const Text(
//                       'Login',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     const SizedBox(height: 8),

//                     const Text(
//                       'Silakan masuk ke akun Anda',
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),

//                     const SizedBox(height: 32),

//                     // EMAIL
//                     TextFormField(
//                       controller: emailController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Email wajib diisi';
//                         }

//                         if (!value.contains('@')) {
//                           return 'Format email tidak valid';
//                         }

//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         hintText: 'Masukkan email',
//                         prefixIcon: const Icon(Icons.email),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 16),

//                     // PASSWORD
//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Password wajib diisi';
//                         }

//                         if (value.length < 6) {
//                           return 'Password minimal 6 karakter';
//                         }

//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         hintText: 'Masukkan password',
//                         prefixIcon: const Icon(Icons.lock),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 24),

//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                         ),
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             showDialog(
//                               context: context,
//                               builder: (_) => AlertDialog(
//                                 title: const Text('Data'),
//                                 content: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Email: ${emailController.text}'),
//                                     Text(
//                                       'Password: ${passwordController.text}',
//                                     ),
//                                   ],
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () async {
//                                       Navigator.pop(context);

//                                       await PreferenceHandler.setLogin(true);

//                                       if (!context.mounted) return;

//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               HalamanTerimaKasih(
//                                                 email: emailController.text,
//                                               ),
//                                         ),
//                                       );
//                                     },
//                                     child: const Text('Lanjutkan'),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }
//                         },
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HalamanTerimaKasih extends StatelessWidget {
//   final String email;
//   const HalamanTerimaKasih({super.key, required this.email});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Konfirmasi')),
//       body: Center(
//         child: Text(
//           'Terima kasih, $email',
//           style: TextStyle(fontSize: 18),
//           textAlign: TextAlign.center,
//         ), // Text
//       ), // Center
//     ); // Scaffold
//   }
// }
