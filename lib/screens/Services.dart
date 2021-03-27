import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatefulWidget {
  Services({Key key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Beat The Virus"),
            elevation: 0,
            backgroundColor: Color(0xFF82D8FF),
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
                icon: Icon(Icons.fastfood),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            })),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF82D8FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150))),
          ),
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                SizedBox(height: 50),
                CarouselSlider(
                    items: [
                      Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/yoga.jpg',
                              fit: BoxFit.cover,
                            )),
                        Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Text('Yoga',
                                style: TextStyle(
                                    fontSize: 60,
                                    fontFamily: 'Forte',
                                    color: Colors.white))),
                        Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                onPressed: () {},
                                child: Text('EXPLORE +',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 18))))
                      ]),
                      Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/meditation.jpg',
                              fit: BoxFit.cover,
                            )),
                        Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Text('Meditation',
                                style: TextStyle(
                                    fontSize: 60,
                                    fontFamily: 'Forte',
                                    color: Colors.white))),
                        Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                onPressed: () {},
                                child: Text('EXPLORE +',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 18))))
                      ]),
                      Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/fitness.jpg',
                              fit: BoxFit.cover,
                            )),
                        Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Text('Fitness',
                                style: TextStyle(
                                    fontSize: 60,
                                    fontFamily: 'Forte',
                                    color: Colors.white))),
                        Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                onPressed: () {},
                                child: Text('EXPLORE +',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 18))))
                      ]),
                      Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/services.jpg',
                              fit: BoxFit.cover,
                            )),
                        Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Column(
                              children: [
                                Text('Other',
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontFamily: 'Forte',
                                        color: Colors.white)),
                                Text('Services',
                                    style: TextStyle(
                                        fontSize: 60,
                                        fontFamily: 'Forte',
                                        color: Colors.white))
                              ],
                            )),
                        Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                onPressed: () {},
                                child: Text('EXPLORE +',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 18))))
                      ]),
                    ],
                    options: CarouselOptions(
                        initialPage: 0,
                        enlargeCenterPage: true,
                        height: MediaQuery.of(context).size.height * 0.60,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;
                          });
                        })),
                Image.asset('assets/images/dropShadowNew.png',
                    width: 280, height: 50),
                Container(
                  height: 40,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (ctx, index) {
                        return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPos == index
                                  ? Colors.blue
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ));
                      }),
                )
              ])),
          Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text('Services we offer',
                  style: TextStyle(fontFamily: 'Vivaldi', fontSize: 66)))
        ]));
  }
}
