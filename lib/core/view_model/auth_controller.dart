import 'package:ecommerce_app/View/home_screen.dart';
import 'package:ecommerce_app/core/service/firestore_user.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;
  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  void googleSignInMethod() async {
    GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    //UserCredential userCredential =
    await _firebaseAuth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(HomeScreen());
    });
    //print(userCredential.user);
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final faceCredential = FacebookAuthProvider.credential(accessToken.token);
      //UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(faceCredential).then((user) {
        saveUser(user);
        Get.offAll(HomeScreen());
      });
      // print(userCredential.user);
    }
  }

  void logInWithEmail() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user);
        Get.offAll(HomeScreen());
      });
    } catch (e) {
      Get.snackbar("Error LogIn Account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmail() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
        Get.offAll(HomeScreen());
      });
    } catch (e) {
      Get.snackbar("Error Registration Account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential userCredential) async {
    return await FireStoreUser().addUserToFireStore(UserModel(
        userId: userCredential.user.uid,
        email: userCredential.user.email,
        name: name==null? userCredential.user.displayName: name,
        pic: ""));
  }
}
