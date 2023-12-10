class SingleCustomerModel {
  int? errorCode;
  Data? data;
  String? message;

  SingleCustomerModel({this.errorCode, this.data, this.message});

  SingleCustomerModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Null? profilePic;
  String? mobileNumber;
  String? email;
  String? street;
  String? streetTwo;
  String? city;
  int? pincode;
  String? country;
  String? state;
  String? createdDate;
  String? createdTime;
  String? modifiedDate;
  String? modifiedTime;
  bool? flag;

  Data(
      {this.id,
      this.name,
      this.profilePic,
      this.mobileNumber,
      this.email,
      this.street,
      this.streetTwo,
      this.city,
      this.pincode,
      this.country,
      this.state,
      this.createdDate,
      this.createdTime,
      this.modifiedDate,
      this.modifiedTime,
      this.flag});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    street = json['street'];
    streetTwo = json['street_two'];
    city = json['city'];
    pincode = json['pincode'];
    country = json['country'];
    state = json['state'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    modifiedDate = json['modified_date'];
    modifiedTime = json['modified_time'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profile_pic'] = profilePic;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['street'] = street;
    data['street_two'] = streetTwo;
    data['city'] = city;
    data['pincode'] = pincode;
    data['country'] = country;
    data['state'] = state;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['modified_date'] = modifiedDate;
    data['modified_time'] = modifiedTime;
    data['flag'] = flag;
    return data;
  }
}
