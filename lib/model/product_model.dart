import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductModel {
  String name, size, description, imageUrl, productId, price;
  Color color;

  ProductModel(
      {this.name,
      this.imageUrl,
      this.description,
      this.price,
      this.size,
      this.color,
      this.productId});

  ProductModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    name = map['name'];
    imageUrl = map['imageUrl'];
    description = map['description'];
    size = map['size'];
    price = map['price'];
    color = HexColor(map['color']);
    productId = map['productId'];
  }
  toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'size': size,
      'price': price,
      'color': color,
      'productId':productId,
    };
  }
}
