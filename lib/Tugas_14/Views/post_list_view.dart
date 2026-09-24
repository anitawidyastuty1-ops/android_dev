import 'package:android_dev/Tugas_14/models/product_detail_screen.dart'; // Import halaman detail produk
import 'package:android_dev/Tugas_14/models/product_models.dart';
import 'package:android_dev/Tugas_14/services/dio_clients.dart';
import 'package:android_dev/tugas_14/services/api_services.dart';
import 'package:flutter/material.dart';

class PostListScreenDay32 extends StatefulWidget {
  const PostListScreenDay32({super.key});

  @override
  State<PostListScreenDay32> createState() => _PostListScreenDay32State();
}

class _PostListScreenDay32State extends State<PostListScreenDay32> {
  late final ApiServices _apiService;
  late Future<ProductModels> _productsFuture;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiServices(dio);
    _productsFuture = _apiService.getAllProducts();
  }

  // Method untuk mereset/refetch data
  Future<void> _refreshPosts() async {
    setState(() {
      _productsFuture = _apiService.getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder<ProductModels>(
        future: _productsFuture,
        builder: (BuildContext context, AsyncSnapshot<ProductModels> snapshot) {
          // State 1: Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // State 2: Error
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'Gagal memuat data:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshPosts,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          final products = snapshot.data?.products ?? [];

          // State 3: Data Kosong
          if (products.isEmpty) {
            return const Center(child: Text('Tidak ada data produk.'));
          }

          // State 4: Sukses
          return RefreshIndicator(
            onRefresh: _refreshPosts,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    // Event ketika item produk diklik
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: product, // Mengirim data produk ke ProductDetailScreen
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage:
                          (product.thumbnail != null &&
                              product.thumbnail!.isNotEmpty)
                          ? NetworkImage(product.thumbnail!)
                          : null,
                      child:
                          (product.thumbnail == null ||
                              product.thumbnail!.isEmpty)
                          ? Text(
                              '${product.id ?? ''}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            )
                          : null,
                    ),
                    title: Text(
                      product.title ?? "-",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      product.description ?? "-",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                      '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
