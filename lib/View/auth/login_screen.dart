import 'package:ecommerce_app/View/auth/signup_screen.dart';
import 'package:ecommerce_app/View/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/View/widgets/custom_text.dart';
import 'package:ecommerce_app/View/widgets/custom_text_button.dart';
import 'package:ecommerce_app/View/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/core/view_model/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constant.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {

  GlobalKey<FormState> _formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      text: "Welcome,",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: ()=>Get.to(SignUpScreen()),
                      child: CustomText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: KPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to Continue",
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: 'iamdavid@gmail.com',
                  validator: (String value){
                    if(value==null || !value.contains('@')){
                      return "Enter a valid email";
                    }else return null;
                  },
                  onSave: (String value){
                    controller.email=value.trim();
                  },

                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "*********",
                  validator: (String value){
                    if(value==null || value.length <6){
                      return "Is too short";
                    }else return null;
                  },
                  onSave: (String value){
                    controller.password=value.trim();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Forgot Password?",
                  alignment: Alignment.topRight,
                  fontSize: 14,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomElevatedButton(
                  text: "SIGN IN",
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      _formKey.currentState.save();
                      controller.logInWithEmail();
                    }

                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: "-OR-",
                  fontSize: 18,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 15,),
                CustomTextButton(
                  text: "Sign In with Facebook",
                  imageUrl: 'assets/images/facebook.png',
                  onPressed: (){
                    controller.facebookSignInMethod();
                  },
                ),
                SizedBox(height: 20,),
                CustomTextButton(
                  text: "Sign In with Google",
                  imageUrl: 'assets/images/google.png',
                  onPressed: (){
                    controller.googleSignInMethod();
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
