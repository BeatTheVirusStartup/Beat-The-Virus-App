import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgLS = [
    'assets/images/yoga.jpg',
    'assets/images/mentalAwareness.jpg',
    'assets/images/fitness.jpg',
    'assets/images/meditation.jpg'
  ];
  List<String> titleLS = ['Yoga', 'Mental Awareness', 'Fitness', 'Meditation'];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Stack(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/Group 3.png'),
                )
              ])),
              Expanded(
                  child: Stack(children: [
                Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Image.asset('assets/images/Group 1.png'))
              ])),
            ],
          ),
          Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Text('Welcome',
                    style: Theme.of(context).textTheme.headline6),
              )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  child: Text('What we Offer ?',
                      style: Theme.of(context).textTheme.bodyText1)),
              Expanded(
                flex: 2,
                child: GridView.builder(
                    //shrinkWrap: true,
                    padding: EdgeInsets.all(8.0),
                    itemCount: imgLS.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: SizeConfig.screenWidth /
                      //     (SizeConfig.screenHeight / 2.25),
                      crossAxisSpacing: 10.0,
                      // mainAxisSpacing: 5.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(imgLS[index],
                                width: SizeConfig.safeBlockHorizontal * 40,
                                height: SizeConfig.safeBlockVertical * 16,
                                fit: BoxFit.cover)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(titleLS[index],
                              style: Theme.of(context).textTheme.bodyText2),
                        )
                      ]);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
