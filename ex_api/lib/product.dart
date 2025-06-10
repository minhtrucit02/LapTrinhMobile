class Product {
  Product({
    required this.id,
    required this.name,
    required this.des,
    required this.price,
    required this.imgURL,
  });
  final String id;
  final String name;
  final String des;
  final double price;
  final String imgURL;

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: data['id'] ?? '',
      name: data['name']?? '',
      des: data['des'] ?? '',
      price: (data['price'] as num).toDouble(),
      imgURL: data['imgURL'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'des': des,
    'price': price,
    'imgURL': imgURL,
  };
}
