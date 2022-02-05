import 'package:buy_it/constants.dart';
import 'package:buy_it/models/product.dart';
import 'package:buy_it/widgets/addproduct_field.dart';
import 'package:buy_it/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:buy_it/services/store.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  static String id = "AddProduct";
  late String _name, _price, _description;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddProductField(
              hint: "Product Name",
              onClick: (value) {
                _name = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            AddProductField(
              hint: "Product Price",
              onClick: (value) {
                _price = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            AddProductField(
              hint: "Product Description",
              onClick: (value) {
                _description = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();
                  await _store.addProduct(
                    Product(
                      pName: _name,
                      pPrice: _price,
                      pDescription: _description,
                    ),
                  );
                  print("Done");
                }
              },
              child: Text("Add Product"),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
