import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/provider/customer_screen_provider/customer_provider.dart';
import 'package:nesto_hypermarket/view/customer/widget/circular_button_widget.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({
    required this.bottomSheet,
    Key? key,
  }) : super(key: key);
  VoidCallback bottomSheet;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
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
              widget.bottomSheet();
            },
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
