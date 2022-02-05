import 'package:buy_it/constants.dart';
import 'package:buy_it/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(Product product) {
    _firestore.collection(kProductCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductPrice: product.pPrice
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection(kProductCollection).snapshots();
  }

  // Future<List<Product>> loadProduct() async {
  //   List<Product> products = [];
  //   await for (var snapshot
  //       in _firestore.collection(kProductCollection).snapshots()) {
  //     print(snapshot.docs);
  //     for (var doc in snapshot.docs) {
  //       var data = doc.data();
  //       products.add(
  //         Product(
  //           pName: data[kProductName],
  //           pDescription: data[kProductDescription],
  //           pPrice: data[kProductPrice],
  //         ),
  //       );
  //     }
  //   }
  //   return products;
  // }
}
