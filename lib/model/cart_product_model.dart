import 'package:ecommerce_app/constant.dart';


class CartProductModel {
  String name, imageUrl, price,productId;
  int quantity;

  CartProductModel({
    this.name,
    this.imageUrl,
    this.price,
    this.quantity,
    this.productId
  });

  CartProductModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    name = map[columnName];
    imageUrl = map[columnImageUrl];
    price = map[columnPrice];
    quantity = map[columnQuantity];
    productId=map[columnProductId];
  }
  toJson() {
    return {
      columnName: name,
      columnImageUrl: imageUrl,
      columnPrice: price,
      columnQuantity: quantity,
      columnProductId:productId
    };
  }
}
