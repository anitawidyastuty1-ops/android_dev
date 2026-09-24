//  import 'package:flutter/material.dart';

//  class LatihanBottomNavigator extends StatefulWidget {
//    const LatihanBottomNavigator ({super.key});

//    @override
//    LatihanBottomNavigatorState createState() => LatihanBottomNavigatorState();
//  }

//  class LatihanBottomNavigatorState extends State<LatihanBottomNavigator
//     const MyApp({super.key});

//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Login UI',
//        theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
//        home: const LoginPage(),
//      );
//    }
//  }

//  class LoginPage extends StatelessWidget {
//    const LoginPage({super.key});

//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        body: SafeArea(
//          child: Column(
//            children: [
//              // ================= HEADER =================
//           Expanded(
//                flex: 5,
//                child: Container(
//                  width: double.infinity,
//                  color: Colors.grey,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: const [
//                      Text(
//                        'Welcome Back',
//                        style: TextStyle(
//                          fontSize: 32,
//                          fontWeight: FontWeight.bold,
//                          color: Color(0xFFFFFFFF),
//                        ),
//                      ),
//                      SizedBox(height: 18),
//                      Text(
//                        'Welcome back to Estore. Have a good time.',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              // ================= LOGIN FORM =================
//              Expanded(
//                flex: 6,
//                child: Container(
//                  width: double.infinity,
//                  padding: const EdgeInsets.symmetric(
//                    horizontal: 32,
//                    vertical: 35,
//                  ),
//                  color: const Color(0xFF07101F),
//                  child: Column(
//                    children: [
//                      // EMAIL
//                      TextField(
//                        style: const TextStyle(color: Colors.white),
//                        decoration: InputDecoration(
//                          prefixIcon: const Icon(
//                            Icons.person_outline,
//                            color: Color(0xFFB0B7C5),
//                          ),
//                          hintText: 'Your Email/id',
//                          hintStyle: const TextStyle(
//                            color: Color(0xFFB0B7C5),
//                            fontSize: 14
