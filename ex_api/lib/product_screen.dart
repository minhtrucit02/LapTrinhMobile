import 'package:ex_api/product.dart';
import 'package:ex_api/product_service.dart';
import 'package:ex_api/product_service_impl.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductServiceImpl productServiceImpl = ProductServiceImpl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Product Detail",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
      body: FutureBuilder<Product>(
        future: productServiceImpl.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Không có dữ liệu.'));
          }

          final product = snapshot.data!;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                        maxHeight: 300,
                      ),
                      child: Card(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8.0),
                          ),
                          child: Image.network(
                            product.imgURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Giá: ${product.price}đ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.grey[300],
                    child:                   Text(product.des),

                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
