import 'dart:io';

class Product {
  late String pName;
  late String pPrice;
  late String pDescription;
  File? image;

  Product(
      {required this.pName, required this.pPrice, required this.pDescription});
}
