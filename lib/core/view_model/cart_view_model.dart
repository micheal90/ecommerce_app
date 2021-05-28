import 'package:ecommerce_app/core/service/database/cart_database_helper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var dbHelper = CartDatabaseHelper.db;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;
  List<CartProductModel> _listCartProductModel = [];
  List<CartProductModel> get listCartProductModel => _listCartProductModel;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _listCartProductModel = await dbHelper.getAllProducts();
    print("product: ${_listCartProductModel.length}");
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    _listCartProductModel.forEach((prod) {
      _totalPrice += (double.parse(prod.price) * prod.quantity);
    });
    print(_totalPrice);
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    //print(_listCartProductModel.length);

    // check if exist product in _listCartProductModel
    var isExist = _listCartProductModel.firstWhere(
        (prod) => prod.productId == cartProductModel.productId,
        orElse: () => null);
    if (isExist != null) return;

    await dbHelper.insert(cartProductModel);
    _listCartProductModel.add(cartProductModel);
    _totalPrice += double.parse(cartProductModel.price);
    print('added to cart');

    update();
  }

  increaseProduct(int index) async{
    _listCartProductModel[index].quantity++;
   await dbHelper.updateProduct(_listCartProductModel[index]);
    _totalPrice += double.parse(_listCartProductModel[index].price);
    update();
  }

  decreaseProduct(int index) async{
    _listCartProductModel[index].quantity--;
    await dbHelper.updateProduct(_listCartProductModel[index]);
    _totalPrice -= double.parse(_listCartProductModel[index].price);
    update();
  }

  deleteTable() async {
    await dbHelper.deleteTable();
    _listCartProductModel = [];
    _totalPrice = 0.0;
    update();
  }
}
