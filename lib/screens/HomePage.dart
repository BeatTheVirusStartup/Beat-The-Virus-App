import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            constraints: BoxConstraints.expand(), color: Colors.blue[300]),
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.40,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Welcome',
                              style: TextStyle(
                                  fontFamily: 'Vivaldi', fontSize: 60.0)),
                          Image.asset('assets/images/Group 3.png',
                              fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(200.0),
                            bottomRight: Radius.circular(200.0))),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What we Offer ?',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          'assets/images/yoga.jpg',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover)),
                                  Text('Yoga',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0))
                                ]),
                                Column(children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          'assets/images/mentalAwareness.jpg',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover)),
                                  Text('Mental Awareness',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0))
                                ]),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          'assets/images/fitness.jpg',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover)),
                                  Text('Fitness',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0))
                                ]),
                                Column(children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          'assets/images/meditation.jpg',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover)),
                                  Text('Meditation',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0))
                                ]),
                              ]),
                        )
                      ]),
                )
              ]),
        ),
      ],
    );
  }
}
