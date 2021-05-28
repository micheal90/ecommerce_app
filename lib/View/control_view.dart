import 'package:ecommerce_app/View/auth/login_screen.dart';
import 'package:ecommerce_app/View/home_screen.dart';
import 'package:ecommerce_app/core/view_model/auth_controller.dart';
import 'package:ecommerce_app/core/view_model/controller_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthController>().user == null
          ? LoginScreen()
          : GetBuilder<ControllerViewModel>(
            init: ControllerViewModel(),
              builder: (controller) => Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: buildBottomNavigationBar(),
                  ));
    });
  }

  Widget buildBottomNavigationBar() => GetBuilder<ControllerViewModel>(
        init: Get.find(),
        builder: (controller) => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset('assets/images/Icon_Explore.png'),
                ),
                label: "",
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Explore'),
                )),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset('assets/images/Icon_Cart.png'),
                ),
                label: "",
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Cart'),
                )),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset('assets/images/Icon_User.png'),
                ),
                label: "",
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Account'),
                )),
          ],
          currentIndex: controller.selectedValue,
          onTap: (index) => controller.changeSelectedValue(index),
          backgroundColor: Colors.grey.shade100,
        ),
      );
}
