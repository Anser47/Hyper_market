
import 'package:flutter/cupertino.dart';
import 'package:nesto_hypermarket/model/product_model.dart';
import 'package:nesto_hypermarket/view_model/product_fetch_function.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductData> productList = [];

  Future<void> getProduct() async {
    try {
      final ProductResponse productResponse = await fetchProducts();

      productList.clear();

      if (productResponse.data != null) {
        productList = productResponse.data!;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
