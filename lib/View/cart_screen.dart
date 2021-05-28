import 'package:ecommerce_app/View/control_view.dart';
import 'package:ecommerce_app/View/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/View/widgets/custom_text.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/service/database/cart_database_helper.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.find(),
              builder: (controller) => ListView.separated(
                itemCount: controller.listCartProductModel.length,
                itemBuilder: (context, index) => Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                          width: 150,
                          child: Image.network(
                            controller.listCartProductModel[index].imageUrl,
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: controller.listCartProductModel[index].name,
                          ),
                          SizedBox(height: 5),
                          CustomText(
                            text:
                                '\$${controller.listCartProductModel[index].price}',
                            color: KPrimaryColor,
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 40,
                            //padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  //padding: EdgeInsets.only(bottom: 4),
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      controller.increaseProduct(index),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                  text:
                                      ' ${controller.listCartProductModel[index].quantity}',
                                  fontSize: 18,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                  padding: EdgeInsets.only(bottom: 15),
                                  icon: Icon(Icons.minimize),
                                  onPressed: () =>
                                      controller.decreaseProduct(index),
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: 'TOTAL',
                      fontSize: 14,
                    ),
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                      builder: (controller) => CustomText(
                        text: '\$${controller.totalPrice}',
                        color: KPrimaryColor,
                      ),
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: Get.find(),
                                  builder: (controller)=>Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: CustomElevatedButton(
                      text: 'CHECKOUT',
                      onPressed: ()=>controller.deleteTable()
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
