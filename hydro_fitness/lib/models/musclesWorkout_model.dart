import 'package:flutter/material.dart';

class WorkoutMuscle {
  String? id;
  String? workoutName;
  String? workoutDetailsTime;
  String? workoutDetailsExercises;
  String? workoutDetailsSetandReps;

  String? workoutImage;

  WorkoutMuscle(
      {this.id,
      this.workoutName,
      this.workoutDetailsTime,
      this.workoutDetailsSetandReps,
      this.workoutDetailsExercises,
      this.workoutImage});

  WorkoutMuscle.fromMap(Map snapshot, String id)
      : id = id,
        workoutName = snapshot["workoutName"] ?? "",
        workoutDetailsTime = snapshot["workoutDetailsTime"] ?? "",
        workoutDetailsExercises = snapshot["workoutDetailsExercises"] ?? "",
        workoutDetailsSetandReps = snapshot["workoutDetailsSetandReps"] ?? "",
        workoutImage = snapshot["workoutImage"] ?? "";

  toJson() {
    return {
      "workoutName": workoutName,
      "workoutDetailsTime": workoutDetailsTime,
      "workoutDetailsExercises": workoutDetailsExercises,
      "workoutDetailsSetandReps": workoutDetailsSetandReps,
      "workoutImage": workoutImage,
    };
  }
}
