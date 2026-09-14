import 'package:flutter/material.dart';

class LatihanBottomNavigator extends StatefulWidget {
  const LatihanBottomNavigator ({super.key});

  @override
  LatihanBottomNavigatorState createState() => LatihanBottomNavigatorState(); 
}

class LatihanBottomNavigatorState extends State<LatihanBottomNavigator
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      'Welcome back to Estore. Have a good time.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
              ),
            ),

            // ================= LOGIN FORM =================
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 35,
                ),
                color: const Color(0xFF07101F),
                child: Column(
                  children: [
                    // EMAIL
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Color(0xFFB0B7C5),
                        ),
                        hintText: 'Your Email/id',
                        hintStyle: const TextStyle(
                          color: Color(0xFFB0B7C5),
                          fontSize: 14,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF263246)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1E4ED8)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // PASSWORD
                    TextField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFFB0B7C5),
                        ),
                        hintText: 'Your Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFFB0B7C5),
                          fontSize: 14,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF263246)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF1E4ED8)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // FORGOT PASSWORD
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(
                          color: Color(0xFFB0B7C5),
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const SizedBox(height: 11),

                    // LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1737C9),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 11),

                    // DIVIDER OR
                    Row(
                      children: const [
                        Expanded(child: Divider(color: Color(0xFF596170))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'or',
                            style: TextStyle(
                              color: Color(0xFFB0B7C5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Color(0xFF596170))),
                      ],
                    ),

                    const SizedBox(height: 11),

                    // SOCIAL BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF111C2D),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'Facebook',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 18),

                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF111C2D),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'Gmail',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
