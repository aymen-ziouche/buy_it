import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/Logo.png"),
          ),
          Positioned(
            bottom: -1,
            child: Text(
              "Buy Art",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}