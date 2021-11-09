import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hydro_fitness/authenticate.dart/signin.dart';
import 'package:hydro_fitness/models/exercise_model.dart';

import 'package:hydro_fitness/services/auth.dart';
import 'package:hydro_fitness/services/viewModel.dart';
import 'package:hydro_fitness/widgets/bottomBar.dart';
import 'package:hydro_fitness/widgets/cheweivideoplayer.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'exerciseVideo.dart';

class Exercises extends StatefulWidget {
  const Exercises({Key? key}) : super(key: key);

  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  late List<ExerciseModel> exerciseModel = [];
  @override
  Widget build(BuildContext context) {
    var exerciseProvider = Provider.of<ExercisesCrudModel>(context);
    AuthServices _auth = AuthServices();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              navigate(
                context,
                BottomBar(),
              );
            },
            color: Colors.white,
          ),
        ),
        body: StreamBuilder(
            stream: exerciseProvider.getStreamData(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                exerciseModel = snapshot.data!.docs
                    .map((doc) => ExerciseModel.fromMap(
                        doc.id, doc.data() as Map<String, dynamic>))
                    .toList();
              } else {
                return Center(child: CircularProgressIndicator());
              }
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                height: MediaQuery.of(context).size.height * 0.89,
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3, crossAxisCount: 2),
                    itemCount: exerciseModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Card(
                          // color: Colors.green,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    imageUrl:
                                        "${exerciseModel[index].ExerciseImage}",
                                    placeholder: (context, url) => Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 60,
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.amber,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                "${exerciseModel[index].ExerciseName}"),
                                            Text(
                                                "${exerciseModel[index].ExerciseRepsAndSets}"),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          ExerciseVideo()));
                                            },
                                            icon: Icon(
                                                Icons.play_arrow_outlined)),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }),
      ),
    );
  }
}
