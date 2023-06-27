import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:starbuck_app/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(),
            Expanded(
              child: PageView(
                children: [
                  CoffeeWidget(
                    title: "Choco Coffee",
                    price: "6",
                    img: "assets/cupChoco.png",
                    bg: "assets/bgChoco.jpeg",
                    color: Colors.brown.shade700,
                    desc:
                        "Indulge in the rich embrace of Starbuck's chocolate-infused coffee. Delight in the harmonious blend of smooth, robust coffee beans and decadent chocolate notes. ",
                  ),
                  CoffeeWidget(
                    title: "Green Coffee",
                    price: "9",
                    img: "assets/cupGreen.png",
                    bg: "assets/bgGreen.jpeg",
                    color: Colors.green.shade800,
                    desc:
                        "Indulge in the rich embrace of Starbuck's chocolate-infused coffee. Delight in the harmonious blend of smooth, robust coffee beans and decadent chocolate notes. ",
                  ),
                  CoffeeWidget(
                    title: "Black Coffee",
                    price: "4",
                    img: "assets/cupGreen2.png",
                    bg: "assets/bgGreen.jpeg",
                    color: Colors.brown.shade700,
                    desc:
                        "Indulge in the rich embrace of Starbuck's chocolate-infused coffee. Delight in the harmonious blend of smooth, robust coffee beans and decadent chocolate notes. ",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CoffeeWidget extends StatelessWidget {
  String title;
  String desc;
  String price;
  String img;
  Color color;
  String bg;
  CoffeeWidget({
    Key? key,
    required this.title,
    required this.desc,
    required this.price,
    required this.img,
    required this.color,
    required this.bg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Flash(
                child: Text(
                  title,
                  style: GoogleFonts.actor(
                    color: Colors.brown.shade700,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 70, left: 20),
            child: Stack(
              children: [
                // * Content
                Container(
                  height: 500,
                  width: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          bg,
                        ),
                        fit: BoxFit.fitHeight,
                        colorFilter: ColorFilter.mode(
                            color.withOpacity(0.2), BlendMode.dstATop),
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown.shade800),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(children: [
                      SlideInDown(
                        child: Text(
                          title,
                          style: GoogleFonts.actor(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FadeIn(
                        child: Text(
                          desc,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.actor(
                            color: Colors.grey,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Spin(
                          child: Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              color: Colors.green.shade800,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(children: [
                                Text(
                                  "\$  ${price}.",
                                  style: GoogleFonts.actor(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "99",
                                  style: GoogleFonts.actor(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),

                // * glass
              ],
            ),
          ),
          Positioned(
            right: -120,
            bottom: -40,
            child: SizedBox(
              height: 500,
              width: 400,
              child: Bounce(
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // color: Colors.amber,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: Row(children: [
          Icon(
            Icons.location_on,
            color: Colors.green.shade700,
            size: 30,
          ),
          Spacer(),
          Hero(
            tag: "logo",
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SplashScreen();
                }));
              },
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/logo.png",
                  )),
            ),
          ),
          Spacer(),
          Icon(
            Icons.menu,
            color: Colors.green.shade700,
            size: 30,
          )
        ]),
      ),
    );
  }
}
