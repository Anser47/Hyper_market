import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nesto_hypermarket/model/product_model.dart';

Future<ProductResponse> fetchProducts() async {
  final response = await http.get(
    Uri.parse('http://62.72.44.247/api/products/'),
  );

  if (response.statusCode == 200) {
    try {
      return ProductResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print('Error decoding JSON: $e');
      throw Exception('Failed to decode JSON');
    }
  } else {
    print('Failed to load products. Status code: ${response.statusCode}');
    throw Exception('Failed to load products');
  }
}
