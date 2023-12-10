// import 'package:flutter/cupertino.dart';
// import 'package:nesto_hypermarket/model/product_model.dart';
// import 'package:nesto_hypermarket/view_model/product_fetch_function.dart';

// class ProductProvider extends ChangeNotifier {
//   List<ProductResponse> productList = [];

//   Future<void> getProduct() async {
//     try {
//       final List<ProductResponse>? productResponse = await fetchProducts();

//       if (productResponse != null) {
//         productList.addAll(productResponse);
//         notifyListeners();
//       }
//     } catch (e) {
//       print('Error fetching products: $e');
//     }
//   }
// }
