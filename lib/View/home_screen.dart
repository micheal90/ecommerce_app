import 'package:ecommerce_app/View/auth/login_screen.dart';
import 'package:ecommerce_app/View/product_details.dart';
import 'package:ecommerce_app/View/widgets/custom_text.dart';
import 'package:ecommerce_app/core/view_model/controller_view_model.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constant.dart';

class HomeScreen extends StatelessWidget {
  List<String> items = [
    'Men',
    'Women',
    'Devices',
    'a',
    'a',
    'a',
    'a',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildTextFormSearch(),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Categories',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildListViewCategory(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: "See all",
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildListViewProduct(),
                      SizedBox(
                        height: 400,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildListViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
          height: 100,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoryModel.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(8),
                        child: Image.network(
                            controller.categoryModel[index].imageUrl),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: controller.categoryModel[index].name,
                      )
                    ],
                  ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: 20,
                  ))),
    );
  }

  Container buildTextFormSearch() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none),
      ),
    );
  }

  Widget buildListViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
          height: 350,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.productsModel.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailsScreen(
                        model: controller.productsModel[index],
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    controller.productsModel[index].imageUrl,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: controller.productsModel[index].name,
                            alignment: Alignment.bottomLeft,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: controller.productsModel[index].description,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis,
                            alignment: Alignment.bottomLeft,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: "\$${controller.productsModel[index].price}",
                            color: KPrimaryColor,
                            alignment: Alignment.bottomLeft,
                          )
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: 20,
                  ))),
    );
  }
}
