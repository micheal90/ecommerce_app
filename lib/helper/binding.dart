import 'package:ecommerce_app/core/view_model/auth_controller.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/core/view_model/controller_view_model.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ControllerViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
