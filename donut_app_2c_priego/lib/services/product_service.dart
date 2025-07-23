import 'dart:convert';
import 'package:donut_app_2c/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String baseUrl = 'https://localhost:8090';

  static Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      //Del cuerpo de la respuesta, crea una lista de objetos Product
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<Product>> getProductsByCategory(int categoryId) async {
    final response =
        await http.get(Uri.parse("$baseUrl/products/category/$categoryId"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      //Del cuerpo de la respuesta, crea una lista de objetos Product
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products by category');
}
}
}