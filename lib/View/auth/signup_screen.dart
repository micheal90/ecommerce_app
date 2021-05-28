import 'package:ecommerce_app/View/auth/login_screen.dart';
import 'package:ecommerce_app/View/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/View/widgets/custom_text.dart';
import 'package:ecommerce_app/View/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/core/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetWidget<AuthController> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: ()=> Get.offAll(LoginScreen()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Sign Up",
                      fontSize: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Name",
                  hint: 'David Spade',
                  validator: (String value) {
                    if (value == null) {
                      return "Enter a name please";
                    } else
                      return null;
                  },
                  onSave: (String value) {
                    controller.name = value.trim();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: 'iamdavid@gmail.com',
                  validator: (String value) {
                    if (value == null || !value.contains('@')) {
                      return "Enter a valid email";
                    } else
                      return null;
                  },
                  onSave: (String value) {
                    controller.email = value.trim();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "*********",
                  validator: (String value) {
                    if (value == null || value.length < 6) {
                      return "Is too short";
                    } else
                      return null;
                  },
                  onSave: (String value) {
                    controller.password = value.trim();
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                CustomElevatedButton(
                  text: "SIGN UP",
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      controller.signUpWithEmail();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
