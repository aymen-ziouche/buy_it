import 'dart:ffi';
import 'package:buy_it/constants.dart';
import 'package:buy_it/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/services/store.dart';

class EditProduct extends StatefulWidget {
  static String id = "EditProduct";

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();

  // @override
  // void initState() {
  //   super.initState();
  //   getProducts();
  // }

  // void getProducts() async {
  //   _products = await _store.loadProduct();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = [];

              for (var doc in snapshot.data!.docs) {
                var data = doc; // this was doc.data()
                products.add(
                  Product(
                    pName: data[kProductName],
                    pDescription: data[kProductDescription],
                    pPrice: data[kProductPrice],
                  ),
                );
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Text(products[index].pName),
                itemCount: products.length,
              );
            } else {
              return Center(
                child: Text("Loading..."),
              );
            }
          }),
    );
  }
}
