import 'package:ecommerce_app/View/control_view.dart';
import 'package:ecommerce_app/View/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/View/widgets/custom_text.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/model/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModel model;
  ProductDetailsScreen({
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Image.network(
              model.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.40,
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Size',
                              ),
                              CustomText(
                                text: model.size,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Color',
                              ),
                              Container(
                                height: 20,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: model.color,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: 'Details',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: model.description,
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'PRICE',
                      fontSize: 14,
                    ),
                    CustomText(
                      text: '\$${model.price}',
                      color: KPrimaryColor,
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: Get.find(),
                  builder: (controller) => Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: CustomElevatedButton(
                      text: 'ADD',
                      onPressed:()=> controller.addProduct(CartProductModel(
                          name: model.name,
                          imageUrl: model.imageUrl,
                          price: model.price,
                          quantity: 1,
                          productId: model.productId)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
