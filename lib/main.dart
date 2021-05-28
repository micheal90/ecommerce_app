import 'package:ecommerce_app/View/control_view.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';

import 'package:ecommerce_app/helper/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'SourceSansPro'),
      home: ControlView(),
    );
  }
}
