// class ProductModel {
//   int? errorCode;
//   List<Data>? data;
//   String? message;

//   ProductModel({this.errorCode, this.data, this.message});

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     errorCode = json['error_code'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['error_code'] = errorCode;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = message;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? image;
//   int? price;
//   String? createdDate;
//   String? createdTime;
//   String? modifiedDate;
//   String? modifiedTime;
//   bool? flag;

//   Data(
//       {this.id,
//       this.name,
//       this.image,
//       this.price,
//       this.createdDate,
//       this.createdTime,
//       this.modifiedDate,
//       this.modifiedTime,
//       this.flag});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     price = json['price'];
//     createdDate = json['created_date'];
//     createdTime = json['created_time'];
//     modifiedDate = json['modified_date'];
//     modifiedTime = json['modified_time'];
//     flag = json['flag'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['image'] = image;
//     data['price'] = price;
//     data['created_date'] = createdDate;
//     data['created_time'] = createdTime;
//     data['modified_date'] = modifiedDate;
//     data['modified_time'] = modifiedTime;
//     data['flag'] = flag;
//     return data;
//   }
// }
class ProductResponse {
  int? errorCode;
  List<ProductData>? data;
  String? message;

  ProductResponse({this.errorCode, this.data, this.message});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      errorCode: json['error_code'],
      data: (json['data'] as List<dynamic>?)
          ?.map((data) => ProductData.fromJson(data))
          .toList(),
      message: json['message'],
    );
  }
}

class ProductData {
  int? id;
  String? name;
  String? image;
  int? price;
  String? createdDate;
  String? createdTime;
  String? modifiedDate;
  String? modifiedTime;
  bool? flag;

  ProductData({
    this.id,
    this.name,
    this.image,
    this.price,
    this.createdDate,
    this.createdTime,
    this.modifiedDate,
    this.modifiedTime,
    this.flag,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      createdDate: json['created_date'],
      createdTime: json['created_time'],
      modifiedDate: json['modified_date'],
      modifiedTime: json['modified_time'],
      flag: json['flag'],
    );
  }
}
