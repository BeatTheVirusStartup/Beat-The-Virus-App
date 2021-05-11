import 'package:beat_the_virus/screens/HomePage.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:beat_the_virus/screens/ContactUs.dart';
import 'package:beat_the_virus/screens/Services.dart';
import 'package:beat_the_virus/screens/Careers.dart';
import 'package:beat_the_virus/screens/ProductsPage.dart';
import 'package:beat_the_virus/main.dart';
import 'package:beat_the_virus/screens/AboutUs.dart';
import 'package:beat_the_virus/screens/Blog.dart';

class DrawerItems extends StatefulWidget {
  DrawerItems({Key key}) : super(key: key);

  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  List<String> menuLS = [
    'HOME',
    'BLOG',
    'PRODUCT',
    'SERVICES',
    'CAREERS',
    'ABOUT',
    'CONTACT'
  ];
  List<FaIcon> menuIconsLS = [
    FaIcon(FontAwesomeIcons.home, color: Colors.black),
    FaIcon(FontAwesomeIcons.blog, color: Colors.black),
    FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.black),
    FaIcon(FontAwesomeIcons.handHoldingHeart, color: Colors.black),
    FaIcon(FontAwesomeIcons.userGraduate, color: Colors.black),
    FaIcon(FontAwesomeIcons.addressCard, color: Colors.black),
    FaIcon(FontAwesomeIcons.addressBook, color: Colors.black)
  ];

  List<MaterialPageRoute> pageRouteLS = [
    MaterialPageRoute(builder: (ctx) => HomePage()),
    MaterialPageRoute(builder: (ctx) => Blog()),
    MaterialPageRoute(builder: (ctx) => Products()),
    MaterialPageRoute(builder: (ctx) => Services()),
    MaterialPageRoute(builder: (ctx) => Careers()),
    MaterialPageRoute(builder: (ctx) => AboutUs()),
    MaterialPageRoute(builder: (ctx) => ContactUs())
  ];

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Column(children: <Widget>[
      Expanded(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.blue[300]),
            child: ListTile(
                leading: FaIcon(FontAwesomeIcons.user,
                    size: SizeConfig.safeBlockVertical * 7,
                    color: Colors.grey[800]),
                title: Text('Welcome Guest',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5)))),
      ),
      Expanded(
          flex: 3,
          child: RawScrollbar(
            thumbColor: Colors.grey,
            controller: _scrollController,
            radius: Radius.circular(8.0),
            thickness: 6.0,
            isAlwaysShown: true,
            child: ListView.separated(
                separatorBuilder: (ct, i) {
                  return Divider();
                },
                physics: BouncingScrollPhysics(),
                itemCount: menuLS.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: menuIconsLS[index],
                    title: Text(menuLS[index]),
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(pageRouteLS[index]);
                      });
                    },
                  );
                }),
          )),
      Expanded(
        flex: 2,
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Connect With Us',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        color: Colors.grey),
                    textAlign: TextAlign.center),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.facebook, size: 48),
                          onPressed: () {}),
                      IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.instagramSquare,
                              size: 48),
                          onPressed: () {}),
                      IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.youtube, size: 48),
                          onPressed: () {}),
                      IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.twitter, size: 48),
                          onPressed: () {}),
                      IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.google, size: 48),
                          onPressed: () {})
                    ]),
                Image(
                    image: AssetImage('assets/icons/btvlogolow.png'),
                    height: 120)
              ]),
        ),
      )
    ]));
  }
}
