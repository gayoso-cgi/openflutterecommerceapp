import 'dart:collection';
import 'dart:math';

import 'package:openflutterecommerce/data/model/product.dart';

import '../cart_item.dart';
import '../commerce_image.dart';
import '../product_attribute.dart';

class PartTimeDataModelTaskOne {
  int id;
  List<Rs> rs;

  PartTimeDataModelTaskOne({this.rs});

  PartTimeDataModelTaskOne.fromJson(Map<String, dynamic> json) {
    int i = 0;
    if (json['rs'] != null) {
      rs = new List<Rs>();
      json['rs'].forEach((v) {
        v["id"] = i;
        rs.add(new Rs.fromJson(v));
        i++;
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rs != null) {
      data['rs'] = this.rs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rs extends CartItem {
  int id;
  String cat;
  String p1;
  CommerceImage p2;
  String p3;
  String p4;
  String p5;
  String p6;
  String p7;
  Null p8;
  Null p9;
  Null p10;

  double get _price => double.tryParse(p6.split(" ").last) ?? 0.0;
  String get _idr => p5.split(" ").first;
  HashMap<ProductAttribute, String> selectedAttributes =
      HashMap<ProductAttribute, String>();
  ProductQuantity productQuantity = ProductQuantity(5);

  Product get product => Product(0,
      title: p4,
      subTitle: p3,
      images: [p2],
      price: _price,
      shortDescription: _idr,
      description: p7);

  Rs(
      {this.productQuantity,
      this.id,
      this.cat,
      this.p1,
      this.p2,
      this.p3,
      this.p4,
      this.p5,
      this.p6,
      this.p7,
      this.p8,
      this.p9,
      this.p10});

  Rs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cat = json['cat'];
    p1 = json['p1'];
    p2 = CommerceImage(json['id'], json['p2'], "description");
    p3 = json['p3'];
    p4 = json['p4'];
    p5 = json['p5'];
    p6 = json['p6'];
    p7 = json['p7'];
    p8 = json['p8'];
    p9 = json['p9'];
    p10 = json['p10'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat'] = this.cat;
    data['p1'] = this.p1;
    data['p2'] = this.p2.address;
    data['p3'] = this.p3;
    data['p4'] = this.p4;
    data['p5'] = this.p5;
    data['p6'] = this.p6;
    data['p7'] = this.p7;
    data['p8'] = this.p8;
    data['p9'] = this.p9;
    data['p10'] = this.p10;
    return data;
  }
}
