class RumahSakit {
  String? id;
  String? name;
  String? address;
  String? category;
  String? imgUrl;

  RumahSakit({this.id, this.name, this.address, this.category, this.imgUrl});

  RumahSakit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    category = json['category'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['category'] = category;
    data['imgUrl'] = imgUrl;
    return data;
  }
}
