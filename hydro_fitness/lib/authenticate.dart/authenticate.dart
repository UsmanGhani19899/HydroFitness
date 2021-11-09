import 'package:flutter/material.dart';
import 'package:hydro_fitness/HydroSplash/hydroIntroScreen.dart';
import 'package:hydro_fitness/models/user_model.dart';

import 'package:hydro_fitness/widgets/bottomBar.dart';

import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user != null) {
      return BottomBar();
    } else {
      return HydroIntroScreen();
    }
  }
}
