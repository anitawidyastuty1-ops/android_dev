import 'package:flutter/material.dart';

class Tugaslayout extends StatelessWidget {
  const Tugaslayout({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewsPage(),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Icon(Icons.menu, size: 30),
                  Expanded(child: Center(child: Row())),
                  Icon(Icons.account_circle, size: 30),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            // CONTENT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CATEGORY
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Innovation",
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // TITLE
                    Text(
                      "Inspirasi Energi\nBagaimana Cara Kerja Turbin Angin Dan Penjelasannya",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),
                    // DATE
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 15),
                        SizedBox(width: 5),
                        Text("8 Maret 2021", style: TextStyle(fontSize: 12)),
                        SizedBox(width: 10),
                        Text(
                          "Oleh Danur Lambang Pristiandaru/Kompas.com",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    // IMAGE
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage("asset/image/Energi Turbin.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // DESCRIPTION
                    Text(
                      "Energi angin adalah salah satu energi terbarukan yang terbentuk dari rotasi bumi dan akibat perbedaan tekanan. Jenis energi ini rupanya telah dimanfaatkan manusia sejak dulu. Menurut publikasi ilmiah yang diterbitkan Journal of American Science, energi angin pertama kali dimanfaatkan untuk menggerakkan perahu oleh bangsa Mesir pada 5000 sebelum masehi (SM). ",
                      style: TextStyle(fontSize: 15, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),

                    SizedBox(height: 10),
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