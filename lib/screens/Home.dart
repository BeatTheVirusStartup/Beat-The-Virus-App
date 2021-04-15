import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Beat The Virus",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actionsIconTheme: IconThemeData(color: Colors.black87),
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
                  color: Colors.black87,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            })
        ),
        body: CustomPaint(
          painter: BgPainter(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                child: Text("Home",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
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
    paint.color = Colors.white;

    canvas.drawPath(curveBg, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

