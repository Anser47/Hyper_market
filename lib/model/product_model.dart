class ProductResponse {
  int? id;
  String? name;
  String? image;
  int? price;
  String? createdDate;
  String? createdTime;
  String? modifiedDate;
  String? modifiedTime;
  bool? flag;

  ProductResponse(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.createdDate,
      this.createdTime,
      this.modifiedDate,
      this.modifiedTime,
      this.flag});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    id = (json["id"] as num).toInt();
    name = json["name"];
    image = json["image"];
    price = (json["price"] as num).toInt();
    createdDate = json["created_date"];
    createdTime = json["created_time"];
    modifiedDate = json["modified_date"];
    modifiedTime = json["modified_time"];
    flag = json["flag"];
  }

  static List<ProductResponse> fromList(List list) {
    return list.map((map) => ProductResponse.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["price"] = price;
    _data["created_date"] = createdDate;
    _data["created_time"] = createdTime;
    _data["modified_date"] = modifiedDate;
    _data["modified_time"] = modifiedTime;
    _data["flag"] = flag;
    return _data;
  }

  ProductResponse copyWith({
    int? id,
    String? name,
    String? image,
    int? price,
    String? createdDate,
    String? createdTime,
    String? modifiedDate,
    String? modifiedTime,
    bool? flag,
  }) =>
      ProductResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        createdDate: createdDate ?? this.createdDate,
        createdTime: createdTime ?? this.createdTime,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        modifiedTime: modifiedTime ?? this.modifiedTime,
        flag: flag ?? this.flag,
      );
}
