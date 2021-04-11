import 'package:flutter/material.dart';
import 'package:beat_the_virus/main.dart';
import 'package:beat_the_virus/screens/Services.dart';
import 'package:beat_the_virus/screens/AboutUs.dart';
import 'package:beat_the_virus/screens/ContactUs.dart';
import 'package:beat_the_virus/screens/Blog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItems extends StatefulWidget {
  DrawerItems({Key key}) : super(key: key);

  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          height: 100,
          decoration: BoxDecoration(color: Colors.blue[300]),
          child: Center(
              child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.user,
                      size: 45, color: Colors.grey[800]),
                  title:
                      Text('Welcome Guest', style: TextStyle(fontSize: 20))))),
      ListTile(
        onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => BeatTheVirus())),
        leading: FaIcon(FontAwesomeIcons.home, color: Colors.black),
        title: Text('HOME'),
      ),
      ListTile(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctc) => AboutUs())),
          leading: FaIcon(FontAwesomeIcons.addressCard, color: Colors.black),
          title: Text('ABOUT')),
      ListTile(
          onTap: () {},
          leading: FaIcon(FontAwesomeIcons.users, color: Colors.black),
          title: Text('TEAM')),
      ListTile(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctc) => Services())),
          leading:
              FaIcon(FontAwesomeIcons.handHoldingHeart, color: Colors.black),
          title: Text('SERVICES')),
      ListTile(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctc) => ContactUs())),
          leading: FaIcon(FontAwesomeIcons.addressBook, color: Colors.black),
          title: Text('CONTACT')),
      ListTile(
          onTap: () {},
          leading: FaIcon(FontAwesomeIcons.userGraduate, color: Colors.black),
          title: Text('CAREERS')),
      ListTile(
          onTap: () {},
          leading: FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.black),
          title: Text('PRODUCT')),
      ListTile(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctc) => Blog())),
          leading: FaIcon(FontAwesomeIcons.blog, color: Colors.black),
          title: Text('BLOG')),
      Divider(color: Colors.grey, height: 1.0),
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Connect With Us',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                      textAlign: TextAlign.center)),
              Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  child: Row(
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
                      ]))
            ]),
            Image(image: AssetImage('assets/icons/btvlogolow.png'), height: 120)
          ])
    ]));
  }
}
