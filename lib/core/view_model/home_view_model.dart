import 'package:ecommerce_app/core/service/home_service.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoriesModel;
  List<CategoryModel> _categoriesModel = [];
  List<ProductModel> get productsModel => _productsModel;
  List<ProductModel> _productsModel = [];

  HomeViewModel() {
    getCategory();
    getProduct();
  }

  getCategory() async {
    _loading.value = true;
    await HomeService().getCategories().then((value) {
      for (int i = 0; i < value.length; i++) {
        categoryModel.add(CategoryModel.fromJson(value[i].data()));
        //print(categoryModel[i].name);
        _loading.value = false;
      }
      update();
    });
  }

  getProduct() async {
    _loading.value = true;
    await HomeService().getProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productsModel.add(ProductModel.fromjson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }
}
