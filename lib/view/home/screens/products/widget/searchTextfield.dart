import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchfiledWidget extends StatelessWidget {
  const SearchfiledWidget({
    super.key,
  });

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
    );
  }
}
