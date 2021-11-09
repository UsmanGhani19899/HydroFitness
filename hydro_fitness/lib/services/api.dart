import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Api {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference? ref;
  String? workouts;

  Api(this.workouts) {
    ref = _db.collection(workouts!);
  }

  Future<QuerySnapshot> getWorkoutData() {
    return ref!.get();
  }

  Stream<QuerySnapshot> streamFetchedData() {
    return ref!.snapshots();
  }

  Future<DocumentSnapshot> getDocumentId(String id) {
    return ref!.doc(id).get();
  }
}

class ApiExercise {
  CollectionReference? ref;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  String? Exercises;

  ApiExercise(this.Exercises) {
    ref = _db.collection(Exercises!);
  }
  Future<QuerySnapshot> getExercises() {
    return ref!.get();
  }

  Stream<QuerySnapshot> streamFetchedData() {
    return ref!.snapshots();
  }

  Future<DocumentSnapshot> documentById(String id) {
    return ref!.doc(id).get();
  }
}
