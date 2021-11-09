import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydro_fitness/HydroSplash/hydroIntroScreen.dart';
import 'package:hydro_fitness/HydroSplash/hydroSplash.dart';
import 'package:hydro_fitness/authenticate.dart/authenticate.dart';
import 'package:hydro_fitness/authenticate.dart/signin.dart';
import 'package:hydro_fitness/screens/HydroHome.dart';
import 'package:hydro_fitness/services/auth.dart';
import 'package:hydro_fitness/services/viewModel.dart';
import 'package:hydro_fitness/widgets/bottomBar.dart';
import 'package:hydro_fitness/widgets/dumbellLoader.dart';
import 'package:hydro_fitness/widgets/introVideo.dart';
import 'package:hydro_fitness/widgets/locator.dart';
import 'package:hydro_fitness/widgets/pageAnimation.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  locators();
  runApp(HydroFitness());
}

class HydroFitness extends StatefulWidget {
  @override
  State<HydroFitness> createState() => _HydroFitnessState();
}

navigate(context, final pageRoute) {
  return Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (ctx) => pageRoute));
}

class _HydroFitnessState extends State<HydroFitness> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CrudModel()),
        ChangeNotifierProvider(create: (_) => ExercisesCrudModel())
      ],
      child: StreamProvider<UserModel?>.value(
        value: AuthServices().user,
        initialData: null,
        child: MaterialApp(
          home: HydroSplash(),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: ThemeData(
              primaryColor: Colors.black,
              textTheme: GoogleFonts.varelaRoundTextTheme().copyWith(
                headline1: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                headline2: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
                headline3: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                headline4: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                headline5: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                headline6: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              buttonTheme: ButtonThemeData(
                  buttonColor: Colors.blue,
                  padding:
                      EdgeInsets.symmetric(horizontal: 100, vertical: 13))),
        ),
      ),
    );
  }
}
