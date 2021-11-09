import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DumbellLoader extends StatelessWidget {
  const DumbellLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
      // color: Colors.white,
      child: Lottie.asset(
        "assets/images/lottieloader.json",
      ),
    );
  }
}
