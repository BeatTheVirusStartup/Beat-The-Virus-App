import 'package:flutter/material.dart';
import 'dart:ui';
import '../widgets/DrawerItems.dart';
import 'package:beat_the_virus/widgets/DrawerItems.dart';

class Home extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: DrawerItems(),
        ),
        appBar: AppBar(
            title: Text(
              "Beat The Virus",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.lightBlueAccent.shade700,
            elevation: 0,
            actionsIconTheme: IconThemeData(color: Colors.white),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => debugPrint("search pressed")),
              IconButton(
                  icon: Icon(Icons.help),
                  onPressed: () => debugPrint("help pressed")),
            ],
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.fastfood,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            })
        ),
        body: SafeArea(
          child: CustomPaint(
            painter: BgPainter(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                  child: Text("Home",
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                // FractionallySizedBox(
                //   heightFactor: 1,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                  child: Text("What we offer?",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/yoga.png',
                            height: 100,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text("Yoga",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0
                              ),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/meditation.png',
                            height: 100,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text("Meditation",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0
                              ),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/fitness.png',
                            height: 100,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text("Fitness",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0
                            ),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/acu.png',
                            height: 100,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text("Acupuncture",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0
                              ),),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}

class BgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    Paint paint = Paint();
    Path mainBg = Path();

    mainBg.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.lightBlueAccent;

    canvas.drawPath(mainBg, paint);

    Path curveBg = Path();

    curveBg.moveTo(0, height * 0.25);
    curveBg.quadraticBezierTo(width / 2, height / 2, width, height * 0.25);
    curveBg.lineTo(width, 0);
    curveBg.lineTo(0, 0);
    paint.color = Colors.white60;

    canvas.drawPath(curveBg, paint);

    Path topCurve = Path();

    topCurve.moveTo(0, height * 0.0833);
    topCurve.quadraticBezierTo(width * 0.25, height * 0.150, width * 0.5, height * 0.0833);
    topCurve.quadraticBezierTo(width * 0.75, height * 0.04, width * 1.0, height * 0.0833);
    topCurve.lineTo(width, 0);
    topCurve.lineTo(0, 0);
    paint.color = Colors.lightBlueAccent.shade700;
    canvas.drawPath(topCurve, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

