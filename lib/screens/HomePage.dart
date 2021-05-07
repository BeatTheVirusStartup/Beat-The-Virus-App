import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: [
        Container(
            constraints: BoxConstraints.expand(), color: Colors.blue[300]),
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(alignment: Alignment.centerRight, children: [
                  Container(
                    width: double.infinity,
                    height: SizeConfig.safeBlockVertical * 40,
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/Group 3.png',
                        width: 100,
                        height: 50,
                        // width: SizeConfig.safeBlockHorizontal * 40,
                        // height: SizeConfig.safeBlockVertical * 30,
                        fit: BoxFit.cover),
                    // child: Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    // Text('Welcome',
                    //     style: TextStyle(
                    //         fontFamily: 'Vivaldi',
                    //         fontSize:
                    //             SizeConfig.safeBlockHorizontal * 15)),
                    // Image.asset('assets/images/Group 3.png',
                    //     width: 100,
                    //     height: 50,
                    //     // width: SizeConfig.safeBlockHorizontal * 40,
                    //     // height: SizeConfig.safeBlockVertical * 30,
                    //     fit: BoxFit.cover),
                    //     ],
                    //   ),
                    // ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(200.0),
                            bottomRight: Radius.circular(200.0))),
                  ),
                  Text('Welcome',
                      style: TextStyle(
                          fontFamily: 'Vivaldi',
                          fontSize: SizeConfig.safeBlockHorizontal * 15)),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What we Offer ?',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 7,
                              color: Colors.white),
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
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  40,
                                          height:
                                              SizeConfig.safeBlockVertical * 16,
                                          fit: BoxFit.cover)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Yoga',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
                                  )
                                ]),
                                Column(children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          'assets/images/mentalAwareness.jpg',
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  40,
                                          height:
                                              SizeConfig.safeBlockVertical * 16,
                                          fit: BoxFit.cover)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Mental Awareness',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
                                  )
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
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  40,
                                          height:
                                              SizeConfig.safeBlockVertical * 16,
                                          fit: BoxFit.cover)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Fitness',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
                                  )
                                ]),
                                Column(children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          'assets/images/meditation.jpg',
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  40,
                                          height:
                                              SizeConfig.safeBlockVertical * 16,
                                          fit: BoxFit.cover)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Meditation',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
                                  )
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
