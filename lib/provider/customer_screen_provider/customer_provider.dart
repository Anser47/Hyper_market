import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/model/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerPovider extends ChangeNotifier {
  // List<CustomersModel> customerList = [];
  // Future<List<CustomersModel>> getCustomer() {
  //   final response = http.get(Uri.parse('http://62.72.44.247/api/customers/'));
  // }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add Customer',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Color.fromARGB(255, 5, 85, 151),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CupertinoColors.systemGrey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  placeholder: 'Customer Name',
                  padding: const EdgeInsets.all(12.0),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 5.0),
                const CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.systemGrey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  placeholder: 'Mobile Number',
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 6.0),
                const CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.systemGrey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  placeholder: 'Email',
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 13.0),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 13.0),
                const Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Street',
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    SizedBox(width: 14.0),
                    Expanded(
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Street 2',
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'City',
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    SizedBox(width: 14.0),
                    Expanded(
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Pincode',
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Country',
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    SizedBox(width: 14.0),
                    Expanded(
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'State',
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Center(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 3, 82, 146))),
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        );
      },
    );
    notifyListeners();
  }
}
