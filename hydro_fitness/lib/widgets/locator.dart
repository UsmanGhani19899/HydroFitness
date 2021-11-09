import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydro_fitness/services/api.dart';
import 'package:hydro_fitness/services/viewModel.dart';

final getit = GetIt.instance;

void locators() {
  getit.registerSingleton<Api>(Api("workouts"));
  getit.registerSingleton<ApiExercise>(ApiExercise("Exercises"));
  getit.registerSingleton<CrudModel>(CrudModel());
}
