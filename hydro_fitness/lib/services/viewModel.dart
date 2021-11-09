import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hydro_fitness/models/exercise_model.dart';
import 'package:hydro_fitness/models/musclesWorkout_model.dart';
import 'package:hydro_fitness/services/api.dart';
import 'package:hydro_fitness/widgets/locator.dart';

class CrudModel with ChangeNotifier {
  Api _api = getit<Api>();

  List<WorkoutMuscle>? workoutMucsles;

  Future<List<WorkoutMuscle>?> getFetchedData() async {
    var result = await _api.getWorkoutData();
    workoutMucsles = result.docs
        .map((doc) => WorkoutMuscle.fromMap(doc.data() as Map, doc.id))
        .toList();
    return workoutMucsles!;
  }

  Stream<QuerySnapshot> getDataFromStream() {
    return _api.streamFetchedData();
  }

  Future<WorkoutMuscle> getDataWithDoID(String id) async {
    var doc = await _api.getDocumentId(id);
    return WorkoutMuscle.fromMap(doc.data() as Map, doc.id);
  }
}

class ExercisesCrudModel with ChangeNotifier {
  ApiExercise _apiExercise = getit<ApiExercise>();

  List<ExerciseModel>? exercisemodel;

  Future<List<ExerciseModel>?> getFetchedData() async {
    var result = await _apiExercise.getExercises();
    exercisemodel = result.docs
        .map((doc) => ExerciseModel.fromMap(doc.id, doc.data() as Map))
        .toList();
    return exercisemodel;
  }

  Stream<QuerySnapshot> getStreamData() {
    return _apiExercise.streamFetchedData();
  }

  Future<ExerciseModel> getDataBydocId(String id) async {
    var doc = await _apiExercise.documentById(id);
    return ExerciseModel.fromMap(doc.id, doc.data() as Map);
  }
}
