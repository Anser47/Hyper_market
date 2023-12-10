// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:nesto_hypermarket/model/product_model.dart';

// Future<List<ProductResponse>?> fetchProducts() async {
//   try {
//     final response = await http.get(
//       Uri.parse('http://62.72.44.247/api/products/'),
//     );

//     if (response.statusCode == 200) {
//       final List<ProductResponse> allProducts = ProductResponse.fromList(
//         jsonDecode(response.body),
//       );
//       print(allProducts.first.data!.first.name);
//       return allProducts;
//     } else {
//       return [];
//     }
//   } catch (e) {}
//   return [];
// }
