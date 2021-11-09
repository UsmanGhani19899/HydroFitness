import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydro_fitness/authenticate.dart/signin.dart';
import 'package:hydro_fitness/models/musclesWorkout_model.dart';
import 'package:hydro_fitness/screens/exercise.dart';
import 'package:hydro_fitness/widgets/pageAnimation.dart';

class HydroWorkouts extends StatefulWidget {
  final WorkoutMuscle? workoutMuscles;
  HydroWorkouts({this.workoutMuscles});
  // final List<WorkoutMuscle> workoutMuscle;
  @override
  State<HydroWorkouts> createState() => _HydroWorkoutsState();
}

String? workoutName;

class _HydroWorkoutsState extends State<HydroWorkouts> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 20,
          ),

          //height: MediaQuery.of(context).size.height * 0.23,
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topCenter,
                  colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.1)
              ])),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.23,
                imageUrl: "${widget.workoutMuscles!.workoutImage}",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          alignment: Alignment.centerLeft,
          child: Text(
            "${widget.workoutMuscles!.workoutName.toString()}",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.23,
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Duration:  ${widget.workoutMuscles!.workoutDetailsTime.toString()}",
                    style: GoogleFonts.raleway(color: Colors.white),
                  ),
                  Text(
                    "Exercises:  ${widget.workoutMuscles!.workoutDetailsExercises.toString()}",
                    style: GoogleFonts.raleway(color: Colors.white),
                  ),
                  Text(
                    "Sets & Reps:  ${widget.workoutMuscles!.workoutDetailsSetandReps.toString()}",
                    style: GoogleFonts.raleway(color: Colors.white),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    // navigate(context, Exercises());
                    Navigator.of(context).pushReplacement(EnterExitRoute(
                        enterPage: Exercises(), exitPage: HydroWorkouts()));
                  },
                  child: Text(
                    "Try",
                    style: GoogleFonts.roboto(),
                  ))
              // Container(
              //   height: 60,
              //   width: 60,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       border: Border.all(
              //         width: 3,
              //         color: Colors.green,
              //       )),
              //   child: Icon(
              //     Icons.arrow_forward_ios,
              //     color: Colors.green,
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
