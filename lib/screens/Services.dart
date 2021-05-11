import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatefulWidget {
  Services({Key key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150))),
        ),
        Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text('Services we offer',
                  style: TextStyle(
                      fontFamily: 'Vivaldi',
                      fontSize: SizeConfig.safeBlockHorizontal * 15)),
            )),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        width: SizeConfig.screenWidth * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/yoga.jpg'))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Yoga',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 15,
                                      fontFamily: 'Forte',
                                      color: Colors.white)),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  onPressed: () {},
                                  child: Text('EXPLORE +',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5)))
                            ]),
                      ),
                      Container(
                        width: SizeConfig.screenWidth * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/meditation.jpg'))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Meditation',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 15,
                                      fontFamily: 'Forte',
                                      color: Colors.white)),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  onPressed: () {},
                                  child: Text('EXPLORE +',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5)))
                            ]),
                      ),
                      Container(
                        width: SizeConfig.screenWidth * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/fitness.jpg'))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Fitness',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 15,
                                      fontFamily: 'Forte',
                                      color: Colors.white)),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  onPressed: () {},
                                  child: Text('EXPLORE +',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5)))
                            ]),
                      ),
                      Container(
                        width: SizeConfig.screenWidth * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/services.jpg'))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Serices',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 15,
                                      fontFamily: 'Forte',
                                      color: Colors.white)),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  onPressed: () {},
                                  child: Text('EXPLORE +',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5)))
                            ]),
                      ),
                    ],
                    options: CarouselOptions(
                        onPageChanged: (index, reson) {
                          setState(() {
                            _page = index;
                          });
                        },
                        height: SizeConfig.screenHeight * 0.65,
                        enlargeCenterPage: true,
                        initialPage: 0,
                        enableInfiniteScroll: false),
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 4,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (ctx, index) {
                          return Container(
                              width: SizeConfig.safeBlockHorizontal * 2.5,
                              height: SizeConfig.safeBlockVertical * 2.5,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _page == index
                                    ? Colors.blue
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ));
                        }),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
