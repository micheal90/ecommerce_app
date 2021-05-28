import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference _productsCollectionRef =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot<Object>>> getCategories() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future getProducts() async {
    var value = await _productsCollectionRef.get();
    //print(value);
    return value.docs;
  }
}
