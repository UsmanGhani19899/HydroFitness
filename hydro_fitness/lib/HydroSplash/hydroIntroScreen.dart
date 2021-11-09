import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hydro_fitness/authenticate.dart/signin.dart';
import 'package:hydro_fitness/authenticate.dart/signup.dart';
import 'package:hydro_fitness/widgets/introVideo.dart';

class HydroIntroScreen extends StatefulWidget {
  const HydroIntroScreen({Key? key}) : super(key: key);

  @override
  State<HydroIntroScreen> createState() => _HydroIntroScreenState();
}

class _HydroIntroScreenState extends State<HydroIntroScreen>
    with SingleTickerProviderStateMixin {
  // late final AnimationController _animationController =
  //     AnimationController(vsync: this, duration: Duration(seconds: 2))
  //       ..repeat(reverse: true);
  // late final Animation<Offset> _offsetAnimation =
  //     Tween<Offset>(begin: Offset.zero, end: Offset(0, 0.1)).animate(
  //         CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

  // @override
  // void dispose() {
  //   super.dispose();
  //   _animationController.dispose();
  // }

  navigate(context, final pageRoute) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => pageRoute));
  }

  carouselProducts(String carouselImage, carouselTitle, carouselDes) {
    return Container(
      child: Stack(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/$carouselImage.jpg"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1)
                ])),
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage("assets/images/$carouselImage.jpg"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.3,
          //   alignment: Alignment.bottomCenter,
          //   child: FaIcon(
          //     FontAwesomeIcons.bicycle,
          //     color: Colors.white,
          //     size: 60,
          //   ),
          // ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("${carouselTitle}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.82,
                  child: Text("${carouselDes}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3),
                ),
                SizedBox(
                  height: 60,
                )
                // SlideTransition(
                //   position: _offsetAnimation,
                //   child: FaIcon(
                //     FontAwesomeIcons.,
                //     color: Colors.white,
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            CarouselSlider(
              items: [
                // carouselProducts(
                //     "Jeff Seid on Instagram_ __vqfit__B7_mxIvp7Co(JPG)",
                //     "Hydro Fitness",
                //     "Train, Eat & Live better with Hydro team"),
                // Stack(
                //   children: [
                //     Container(
                //         foregroundDecoration: BoxDecoration(
                //             gradient: LinearGradient(
                //                 begin: Alignment.bottomCenter,
                //                 end: Alignment.topCenter,
                //                 colors: [
                //               Colors.black,
                //               Colors.black.withOpacity(0.3),
                //               Colors.black.withOpacity(0.1)
                //             ])),
                //         child: VideoPlayerScreen()),
                //     Container(
                //       alignment: Alignment.bottomCenter,
                //       height: MediaQuery.of(context).size.height * 0.75,
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           Text("Hydro Fitness",
                //               textAlign: TextAlign.center,
                //               style: GoogleFonts.openSans(
                //                   color: Colors.white,
                //                   fontSize: 25,
                //                   fontWeight: FontWeight.bold)),
                //           SizedBox(
                //             height: 15,
                //           ),
                //           Container(
                //             width: MediaQuery.of(context).size.width * 0.82,
                //             child: Text(
                //                 "Train,Eat & Live better with Hydro team",
                //                 textAlign: TextAlign.center,
                //                 style: Theme.of(context).textTheme.headline3),
                //           ),
                //           SizedBox(
                //             height: 60,
                //           )
                //           // SlideTransition(
                //           //   position: _offsetAnimation,
                //           //   child: FaIcon(
                //           //     FontAwesomeIcons.,
                //           //     color: Colors.white,
                //           //   ),
                //           // )
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                carouselProducts("14c5e137facd30a006797a3acd5f9f6e",
                    "Hydro Fitness", "Train,Eat & Live better with Hydro team"),

                carouselProducts("health", "Eat",
                    "Easy, healthy meal plans you'll love. Gulten-free, vegetarian, pescatrian & vegan options."),

                carouselProducts(
                    "David Laid on Instagram_ _--__B8kQ9NzFIbL(JPG)",
                    "Train",
                    "Work out with World-class trainers. HIIT, boxing, pilates, muscle building & more for home or gym."),
              ],
              options: CarouselOptions(
                  reverse: false,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            navigate(context, HydroSignIn());
                          },
                          child: Text(
                            "Signin",
                            style: GoogleFonts.roboto(),
                          )),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          onPressed: () {
                            navigate(context, HydroSignUp());
                          },
                          child: Text(
                            "Join us",
                            style: GoogleFonts.roboto(),
                          )),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
