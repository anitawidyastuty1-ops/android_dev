import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:android_dev/Tugas_14/models/product_models.dart';
import 'package:android_dev/Tugas_14/services/api_services.dart'; // Sesuaikan path ApiServices Anda
import 'package:android_dev/Tugas_14/models/product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ApiServices _apiService;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    _apiService = ApiServices(dio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text('Katalog Produk'), centerTitle: true),
      body: FutureBuilder<ProductModels>(
        future: _apiService.getAllProducts(),
        builder: (context, snapshot) {
          // 1. State Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. State Error
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          // 3. State Sukses Data
          if (snapshot.hasData) {
            final products = snapshot.data?.products ?? [];

            if (products.isEmpty) {
              return const Center(child: Text('Produk tidak ditemukan'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12.0),
              // Konfigurasi Grid 2 Kolom
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 Kolom
                childAspectRatio: 0.7, // Rasio Tinggi vs Lebar Card
                crossAxisSpacing: 12, // Jarak Horisontal
                mainAxisSpacing: 12, // Jarak Vertikal
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    // Navigasi ke Halaman Detail
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias, // Agar gambar terpotong rapi mengikuti border card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- Gambar Produk ---
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: product.thumbnail != null
                                ? Image.network(
                                    product.thumbnail!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.image,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),

                        // --- Informasi Produk ---
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Judul Produk
                              Text(
                                product.title ?? '-',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),

                              // Harga & Rating
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Harga
                                  Text(
                                    '\$${product.price}',
                                    style: const TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),

                                  // Rating
                                  if (product.rating != null)
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          '${product.rating}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: Text('Data kosong'));
        },
      ),
    );
  }
}
