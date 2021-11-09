import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydro_fitness/HydroSplash/hydroIntroScreen.dart';
import 'package:hydro_fitness/models/musclesWorkout_model.dart';
import 'package:hydro_fitness/screens/hydroWorkouts.dart';
import 'package:hydro_fitness/services/auth.dart';
import 'package:hydro_fitness/services/viewModel.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HydroHome extends StatefulWidget {
  const HydroHome({Key? key}) : super(key: key);

  @override
  _HydroHomeState createState() => _HydroHomeState();
}

class _HydroHomeState extends State<HydroHome> {
  List<WorkoutMuscle>? workoutMuscles;

  @override
  Widget build(BuildContext context) {
    var workoutProvider = Provider.of<CrudModel>(context);
    AuthServices _auth = AuthServices();
    void showBox() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(
                        this.context,
                        MaterialPageRoute(
                            builder: (ctx) => HydroIntroScreen()));
                  },
                  child: Text("SignOut")),
            ],
            content: Text("Are you sure. you want to signout"),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "HYDRO\nFITNESS",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showBox();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: workoutProvider.getDataFromStream(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      workoutMuscles = snapshot.data!.docs
                          .map((doc) => WorkoutMuscle.fromMap(
                              doc.data() as Map<String, dynamic>, doc.id))
                          .toList();
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: workoutMuscles!.length,
                          itemBuilder: (context, index) {
                            return HydroWorkouts(
                              workoutMuscles: workoutMuscles![index],
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
