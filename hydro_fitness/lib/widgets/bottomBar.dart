import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hydro_fitness/screens/HydroHome.dart';
import 'package:hydro_fitness/screens/bmi.dart';
import 'package:hydro_fitness/screens/hydroProfile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  int currentIndex = 0;
  final screens = [
    HydroHome(),
    Bmi(),
    HydroProfile(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        //height: MediaQuery.of(context).size.height * 0.1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              iconSize: 20,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.green,
              backgroundColor: Colors.grey.shade900.withOpacity(0.5),
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: FaIcon(
                    FontAwesomeIcons.dumbbell,
                  ),
                ),
                BottomNavigationBarItem(
                    label: "Food",
                    icon: Icon(
                      Icons.calculate,
                    )),
                BottomNavigationBarItem(
                  label: "About",
                  icon: FaIcon(
                    FontAwesomeIcons.infoCircle,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
