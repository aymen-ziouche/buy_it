import 'package:buy_it/constants.dart';
import 'package:buy_it/screens/homepage.dart';
import 'package:buy_it/screens/user/login_screen.dart';
import 'package:buy_it/services/auth.dart';
import 'package:buy_it/widgets/custom_text_field.dart';
import 'package:buy_it/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = "SignupScreen";
  late String _email, _password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: LogoWidget(),
            ),
            SizedBox(
              height: height * .1,
            ),
            CustomTextField(
              hint: "Enter your Name",
              icon: Icons.perm_identity,
              onClick: (value) {
                // pass this one for now
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              hint: "Enter your Email",
              icon: Icons.email,
              onClick: (value) {
                _email = value;
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              hint: "Enter your Password",
              icon: Icons.lock,
              onClick: (value) {
                _password = value;
              },
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    try {
                      final authresult = await _auth.signUp(_email, _password);
                      Navigator.pushNamed(context, HomePage.id);
                      print(authresult.user!.uid);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            e.toString(),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
