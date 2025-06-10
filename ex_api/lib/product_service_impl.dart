import 'dart:convert';

import 'package:ex_api/product.dart';
import 'package:ex_api/product_service.dart';
import 'package:http/http.dart' as http;

class ProductServiceImpl implements ProductService {
  final String url = 'https://mock.apidog.com/m1/890655-872447-default/v2/product';

  @override
  Future<Product> getProduct() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data is Map<String, dynamic>) {
          return Product.fromJson(data);
        } else {
          throw Exception('Dữ liệu không hợp lệ');
        }
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      print("Lỗi tổng: $e");
      rethrow;
    }
  }
}
