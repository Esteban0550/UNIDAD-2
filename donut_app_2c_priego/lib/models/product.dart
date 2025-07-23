class Product {
  final String id;
  final String name;
  final double price;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['productId']?.toString() ?? json['idProducto']?.toString() ?? '',
      name: json['name'] ?? json['nombre'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? json['precioVenta']?.toString() ?? '0') ?? 0.0,
      stock: int.tryParse(json['stock']?.toString() ?? json['cantidadStock']?.toString() ?? '0') ?? 0,
    );
  }
}
