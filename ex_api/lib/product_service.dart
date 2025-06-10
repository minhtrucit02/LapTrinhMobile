import 'package:ex_api/product.dart';

abstract class ProductService{
  Future<Product> getProduct();
}