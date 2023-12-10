import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/provider/customer_screen_provider/customer_provider.dart';
import 'package:nesto_hypermarket/view/common/widget/product_head.dart';
import 'package:nesto_hypermarket/view/customer/widget/circular_button_widget.dart';
import 'package:provider/provider.dart';
import 'widget/customer_card_widget.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final customerProvider = context.read<CustomerPovider>();
    String searchValue = '';
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProducetScreenHeadWidget(size: size, name: 'Customers'),
              CupertinoTextField(
                onSubmitted: (value) {
                  setState(() {
                    searchValue = value;
                  });
                  context.read<CustomerPovider>().getSearchCustomers(value);
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
                    const SizedBox(
                      width: 8,
                    ),
                    CircularButton(
                      icon: Icons.add,
                      circleSize: 25,
                      onPressed: () {
                        context
                            .read<CustomerPovider>()
                            .showBottomSheet(context);
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SearchWidget(bottomSheet: () {
              //     customerProvider.showBottomSheet(context);
              //   }),
              // ),
              customerProvider.searchCustomerList.isEmpty
                  ? CustomersMainBody(customerProvider: customerProvider)
                  : FutureBuilder(
                      future: customerProvider.getSearchCustomers(searchValue),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final searchResults =
                              customerProvider.searchCustomerList;
                          return searchResults.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: customerProvider
                                      .searchCustomerList.length,
                                  itemBuilder: (context, index) {
                                    final customer = searchResults[index];
                                    return GestureDetector(
                                      onTap: () {},
                                      child: CustomerCardWidget(
                                          customer: customer),
                                    );
                                  },
                                )
                              : emptySearch();
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  emptySearch() {
    return const SizedBox(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Not found',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF9C9C9C),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomersMainBody extends StatelessWidget {
  const CustomersMainBody({
    super.key,
    required this.customerProvider,
  });

  final CustomerPovider customerProvider;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: customerProvider.getCustomers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: customerProvider.customerList.length,
            itemBuilder: (context, index) {
              final customer = customerProvider.customerList[index];
              return GestureDetector(
                onTap: () {},
                child: CustomerCardWidget(customer: customer),
              );
            },
          );
        }
      },
    );
  }
}
