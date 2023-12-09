import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/provider/product_provider/product_provider.dart';
import 'package:nesto_hypermarket/view/home/screens/products/widget/product_card.dart';
import 'package:nesto_hypermarket/view/home/screens/products/widget/searchTextfield.dart';
import 'package:provider/provider.dart';
import '../../../../../model/product_model.dart';
import '../../../../common/widget/product_head.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Consumer<ProductProvider>(
              builder: (context, provider, widget) {
                return Column(
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
                        child: const SearchfiledWidget(),
                      ),
                    ),
                    FutureBuilder<void>(
                      // Use void as the future type since getProduct is now void
                      future: provider.getProduct(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          print('Error: ${snapshot.error}');
                          return Text('Error: ${snapshot.error}');
                        }

                        return Consumer<ProductProvider>(
                          builder: (context, provider, widget) {
                            final List<ProductData> productList =
                                provider.productList;
                            print('============== ${productList.length}');
                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: size.width > 600 ? 4 : 2,
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 2.0,
                              ),
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ProductCard(
                                    productModel: productList[index],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
