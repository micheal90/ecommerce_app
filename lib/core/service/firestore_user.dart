import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  Future addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
