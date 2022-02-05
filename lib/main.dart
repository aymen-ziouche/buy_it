import 'package:buy_it/provider/adminMode.dart';
import 'package:buy_it/screens/admin/addproduct.dart';
import 'package:buy_it/screens/admin/adminhome.dart';
import 'package:buy_it/screens/admin/editproduct.dart';
import 'package:buy_it/screens/homepage.dart';
import 'package:buy_it/screens/user/login_screen.dart';
import 'package:buy_it/screens/user/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminMode>(create: (context) => AdminMode())
      ],
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomePage.id: (context) => HomePage(),
          AdminHome.id: (context) => AdminHome(),
          AddProduct.id: (context) => AddProduct(),
          EditProduct.id: (context) => EditProduct(),
        },
      ),
    );
  }
}
