// filepath: c:\Users\hrd24\Documents\Anita\hrd_solution_app_dev\android_dev\android_dev\lib\Tugas_14\models\product_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:android_dev/Tugas_14/models/product_models.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.thumbnail;
    final title = product.title ?? 'Detail Produk';
    final price = product.price != null
        ? '\$${product.price}'
        : 'Harga tidak tersedia';

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                height: 260,
                color: Colors.grey[200],
                child: imageUrl != null && imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => const Icon(
                          Icons.broken_image,
                          size: 70,
                          color: Colors.grey,
                        ),
                      )
                    : const Icon(Icons.image, size: 70, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 21,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (product.rating != null)
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
              ],
            ),

            const Divider(height: 32),

            const Text(
              'Deskripsi Produk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              product.description?.isNotEmpty == true
                  ? product.description!
                  : 'Tidak ada deskripsi.',
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
