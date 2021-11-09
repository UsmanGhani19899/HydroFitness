import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hydro_fitness/HydroSplash/hydroIntroScreen.dart';
import 'package:hydro_fitness/services/auth.dart';

import '../main.dart';

class HydroProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "About Us",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "Hydro Fitness is a fitness apparel & accessories brand, manufacturer and online retailer based in the United Kingdom, supported by millions of highly engaged social media followers and customers in 131 countries. Created in 2012 by teenager Ben Francis and a group of his high-school friends.",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "Follow Us",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Facebook: @HydroFitness",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        "Instagram @HydroFitness",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        "Youtube @HydroFitness",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
