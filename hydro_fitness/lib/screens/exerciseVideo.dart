import 'package:flutter/material.dart';
import 'package:hydro_fitness/main.dart';
import 'package:hydro_fitness/screens/exercise.dart';
import 'package:hydro_fitness/widgets/cheweivideoplayer.dart';
import 'package:hydro_fitness/widgets/introVideo.dart';
import 'package:video_player/video_player.dart';

class ExerciseVideo extends StatefulWidget {
  const ExerciseVideo({Key? key}) : super(key: key);

  @override
  _ExerciseVideoState createState() => _ExerciseVideoState();
}

class _ExerciseVideoState extends State<ExerciseVideo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              HydroVideoPlayer(
                videoPlayerController:
                    VideoPlayerController.asset("assets/images/cardio.mp4"),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        navigate(context, Exercises());
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
