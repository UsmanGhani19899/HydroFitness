class ExerciseModel {
  String? id;
  String? ExerciseName;
  String? ExerciseRepsAndSets;
  String? ExerciseImage;

  ExerciseModel(
      {this.id,
      this.ExerciseName,
      this.ExerciseRepsAndSets,
      this.ExerciseImage});

  ExerciseModel.fromMap(String id, Map snapshot)
      : id = id,
        ExerciseName = snapshot["ExerciseName"] ?? "",
        ExerciseRepsAndSets = snapshot["ExerciseRepsAndSets"] ?? "",
        ExerciseImage = snapshot["ExerciseImage"] ?? "";

  toJson() {
    return {
      "ExerciseName": ExerciseName,
      "ExerciseRepsAndSets": ExerciseRepsAndSets,
      "ExerciseImage": ExerciseImage,
    };
  }
}
