import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro_fitness/HydroSplash/hydroIntroScreen.dart';
import 'package:hydro_fitness/authenticate.dart/authenticate.dart';
import 'package:hydro_fitness/screens/HydroHome.dart';
import 'package:hydro_fitness/services/auth.dart';
import 'package:hydro_fitness/widgets/dumbellLoader.dart';

import '../main.dart';

class HydroSignUp extends StatefulWidget {
  const HydroSignUp({Key? key}) : super(key: key);

  @override
  State<HydroSignUp> createState() => _HydroSignUpState();
}

const decoration = InputDecoration(
    hintStyle: TextStyle(color: Colors.white),
    filled: true,
    border: OutlineInputBorder(borderSide: BorderSide()));
snackbaShow(context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    "data",
    style: TextStyle(color: Colors.red),
  )));
}

class _HydroSignUpState extends State<HydroSignUp> {
  @override
  String email = "";
  String password = "";
  String error = "";
  final _formkey = GlobalKey<FormState>();
  bool isObsecure = true;
  bool isLoading = false;
  final AuthServices _auth = AuthServices();
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? DumbellLoader()
          : Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(
                            splashColor: Colors.green,
                            onPressed: () {
                              navigate(context, HydroIntroScreen());
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        //   height: MediaQuery.of(context).size.height * 0.3,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image(
                          image: AssetImage("assets/images/vector.png"),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 50,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: SingleChildScrollView(
                          child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: decoration.copyWith(
                                        hintText: "Email",
                                        fillColor: Colors.grey.shade900
                                            .withOpacity(0.8)),
                                    validator: (val) => val!.isEmpty
                                        ? "Please Enter Email"
                                        : null,
                                    onChanged: (val) {
                                      setState(() {
                                        email = val;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    obscureText: isObsecure,
                                    decoration: decoration.copyWith(
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isObsecure = !isObsecure;
                                            });
                                          },
                                          child: Icon(
                                            isObsecure == true
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.white,
                                          ),
                                        ),
                                        hintText: "Password",
                                        fillColor: Colors.grey.shade900
                                            .withOpacity(0.8)),
                                    validator: (val) => val!.isEmpty
                                        ? "Please enter password"
                                        : val.length < 6
                                            ? "Password is short"
                                            : null,
                                    onChanged: (val) {
                                      setState(() {
                                        password = val;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                              primary: Colors.green),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              dynamic result = await _auth.signUpWithEmailPass(
                                  email, password);

                              if (result == null) {
                                setState(() {
                                  error = "Could not signin";
                                  isLoading = false;
                                });
                              } else {
                                navigate(context, HydroHome());
                              }
                            }
                          },
                          child: Text("SignUp")),
                      SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   error,
                      //   style: TextStyle(
                      //       color: Colors.red, fontWeight: FontWeight.bold),
                      // )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
