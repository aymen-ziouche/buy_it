import 'package:buy_it/constants.dart';
import 'package:buy_it/screens/admin/addproduct.dart';
import 'package:buy_it/screens/admin/editproduct.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  static String id = "AdminHome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text("Add product"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProduct.id);
            },
            child: Text("Edit product"),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("View orders"),
          ),
        ],
      ),
    );
  }
}
