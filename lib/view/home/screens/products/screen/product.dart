import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nesto_hypermarket/provider/common/product_description.dart';
import 'package:nesto_hypermarket/view/home/screens/products/widget/product_card.dart';
import 'package:nesto_hypermarket/view/home/screens/products/widget/searchTextfield.dart';
import '../../../../../model/product_model.dart';
import '../../../../common/widget/product_head.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<ProductResponse>?> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProducetScreenHeadWidget(
                  size: size,
                  name: "Nesto Hypermarket",
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: CupertinoTextField(
                      onChanged: (value) {
                        setState(() {
                          searchValue = value;
                        });
                      },
                      padding: const EdgeInsets.all(16.0),
                      placeholder: 'Search',
                      placeholderStyle: const TextStyle(color: Colors.grey),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.8),
                          width: 2.0,
                        ),
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(
                          CupertinoIcons.search,
                          color: Colors.grey,
                        ),
                      ),
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.qr_code,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8.0),
                          Container(
                            height: 25,
                            width: 2,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 3.0),
                          TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Text(
                                    'Fruits',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Icon(Icons.arrow_drop_down_rounded)
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                FutureBuilder<List<ProductResponse>?>(
                  future: _futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Text('Error: ${snapshot.error}');
                    }

                    final productList = snapshot.data ?? [];

                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size.width > 600 ? 4 : 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0,
                      ),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        final product = productList[index];
                        print(product.image);
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDiscription(
                                  name: product.name ?? 'name',
                                  price: product.price ?? 89,
                                  img: 'http://62.72.44.247${product.image}',
                                  id: product.id ?? 34,
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            product: product,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<ProductResponse>?> fetchProducts() async {
  try {
    final response = await http.get(
      Uri.parse('http://62.72.44.247/api/products/'),
    );

    if (response.statusCode == 200) {
      final List<ProductResponse> allProducts = ProductResponse.fromList(
        jsonDecode(response.body)['data'],
      );
      // print(allProducts.first.data!.first.name);
      return allProducts;
    } else {
      return [];
    }
  } catch (e) {
    print('Error fetching products: $e');
    return [];
  }
}
