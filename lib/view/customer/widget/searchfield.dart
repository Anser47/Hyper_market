import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/view/customer/widget/circular_button_widget.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    required this.bottomSheet,
    super.key,
  });
  VoidCallback bottomSheet;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
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
                bottomSheet();
              }),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
