import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hydro_fitness/authenticate.dart/authenticate.dart';
import 'package:lottie/lottie.dart';

class HydroSplash extends StatefulWidget {
  const HydroSplash({Key? key}) : super(key: key);

  @override
  _HydroSplashState createState() => _HydroSplashState();
}

class _HydroSplashState extends State<HydroSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Authenticate()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,

        // child: Text(
        //   "HYDRO\nFITNESS",
        //   style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 50),
        // ),
        child: Center(
            child: Lottie.asset(
          "assets/images/splashDum.json",
          repeat: false,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        )),
      ),
    );
  }
}
