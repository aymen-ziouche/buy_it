import 'package:buy_it/constants.dart';
import 'package:flutter/material.dart';

class AddProductField extends StatelessWidget {
  final String hint;
  final onClick;
  String _errormessage(String str) {
    switch (hint) {
      case "Enter Product name":
        return "Name is empty";
      case "Enter product price":
        return "Price is empty";
      case "Enter product description":
        return "description is empty";
    }
    return '';
  }

  AddProductField({
    required this.hint,
    required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errormessage(hint);
          }
        },
        onSaved: onClick,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
