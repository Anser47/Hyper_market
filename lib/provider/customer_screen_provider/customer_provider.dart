import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/model/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerPovider extends ChangeNotifier {
  List<CustomerData> searchCustomerList = [];

  Future<void> getSearchCustomers(String? searchQuery) async {
    final Uri uri = Uri.parse(
        'http://62.72.44.247/api/customers/?search_query=$searchQuery');

    final response = await http.get(uri);
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      searchCustomerList.clear();

      for (Map<String, dynamic> element in data) {
        searchCustomerList.add(CustomerData.fromJson(element));
      }

      notifyListeners();
    } else {
      throw Exception(
          'Failed to load customers. Status code: ${response.statusCode}');
    }
  }

  Future<void> addCustomer(CustomerData customer) async {
    try {
      final response = await http.post(
        Uri.parse('http://62.72.44.247/api/customers/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(customer.toJson()),
      );
      print('==========${response.body}');
      if (response.statusCode == 200) {
        print('==========${response.body}');
        getCustomers();
      } else {
        print('Failed to add customer. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error adding customer: $e');
    }
  }

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController profilePicController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController streetTwoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController createdDateController = TextEditingController();
  TextEditingController createdTimeController = TextEditingController();
  TextEditingController modifiedDateController = TextEditingController();
  TextEditingController modifiedTimeController = TextEditingController();
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
                  controller: nameController,
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
                CupertinoTextField(
                  controller: mobileNumberController,
                  decoration: const BoxDecoration(
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
                CupertinoTextField(
                  controller: emailController,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.systemGrey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  placeholder: 'Email',
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
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
                Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        controller: streetController,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Street',
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: CupertinoTextField(
                        controller: streetTwoController,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Street 2',
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        controller: cityController,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'City',
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: CupertinoTextField(
                        controller: pincodeController,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Pincode',
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        controller: countryController,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'Country',
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    Expanded(
                      child: CupertinoTextField(
                        controller: stateController,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.systemGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        placeholder: 'State',
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
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
                    onPressed: () {
                      CustomerData newCustomer = CustomerData(
                        profilePic: null,
                        id: 234,
                        name: nameController.text,
                        mobileNumber: mobileNumberController.text,
                        email: emailController.text,
                        street: streetController.text,
                        streetTwo: streetTwoController.text,
                        city: cityController.text,
                        pincode: int.tryParse(pincodeController.text),
                        country: countryController.text,
                        state: stateController.text,
                        flag: true,
                        createdDate: '2023-12-06',
                        createdTime: "06:11:54.730226",
                        modifiedDate: "2023-12-06",
                        modifiedTime: "06:11:54.730303",
                      );
                      addCustomer(newCustomer);
                      Navigator.of(context).pop();
                    },
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

  List<CustomerData> customerList = [];
  List<CustomerData> singleCustomerList = [];
  Future<void> getCustomers() async {
    try {
      final response = await http.get(
        Uri.parse('http://62.72.44.247/api/customers/'),
      );

      if (response.statusCode == 200) {
        final customersModel = CustomersModel.fromJson(
          jsonDecode(response.body),
        );

        customerList.clear();

        if (customersModel.data != null) {
          customerList = customersModel.data!;
          notifyListeners();
        }
      } else {
        print('Failed to load customers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching customers: $e');
    }
  }

  Future<void> getSingleCustomers(String id) async {
    try {
      final response = await http.get(
        Uri.parse('http://62.72.44.247/api/customers/?id=$id'),
      );

      if (response.statusCode == 200) {
        final customersModel = CustomersModel.fromJson(
          jsonDecode(response.body),
        );

        singleCustomerList.clear();

        if (customersModel.data != null) {
          singleCustomerList = customersModel.data!;
          notifyListeners();
        }
      } else {
        print('Failed to load customers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching customers: $e');
    }
  }
}
