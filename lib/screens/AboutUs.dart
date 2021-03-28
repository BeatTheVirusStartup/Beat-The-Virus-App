import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int currentPos = 0;
  List<List<String>> imgList = [
    ['first_item'],
  ];

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
                        items: imgList.map((i) {
                          return Builder(builder: (BuildContext context) {
                            return Stack(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                      height: 500,
                                      width: 900,
                                      color: Colors.lightBlueAccent,
                                      child: SingleChildScrollView(
                                        child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Text(
                                                    'For Preventing Coronavirus and building Long term Health, Beat the Virus Startup through its 400+ Team Members offers Immunity and Health Solutions to Employees and their Families Globally.',
                                                    style: TextStyle(fontSize: 20)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Text(
                                                    'We do this by offering 15+ Categories of Immunity Products and Services.',
                                                    style: TextStyle(fontSize: 20)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Text(
                                                    'Our 400+ Team Members have several decades of Health, Execution and other complimentary aspect.',
                                                    style: TextStyle(fontSize: 20)),
                                              ),
                                            ]
                                        ),
                                      )), ),
                            ]);
                          });
                        }).toList(),
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
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imgList.map((url) {
                              int index = imgList.indexOf(url);
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
                            }).toList()))
                  ])),
          Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text('About Us',
                  style: TextStyle(fontSize: 50 ,color: Colors.white, fontWeight: FontWeight.w600)))
          ]));
  }
}
