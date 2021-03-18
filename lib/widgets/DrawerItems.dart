import 'package:flutter/material.dart';

import '../aboutus.dart';
import '../blog.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget drawerItems() {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              height: 100,
              decoration: BoxDecoration(color: Colors.blue[300]),
              child: Stack(children: [
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: InkWell(
                        onTap: () {},
                        child: Image(
                            image: AssetImage('assets/icons/user.png'),
                            height: 80))),
                Align(
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Welcome Guest',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))))
              ])),
          ListTile(
              onTap: () {},
              leading: Image.asset('assets/icons/home.png'),
              title: Text('HOME')),
          ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            aboutus())); //navigation aboutus added
              },
              leading: Image.asset('assets/icons/about.png'),
              title: Text('ABOUT')),
          ListTile(
              onTap: () {},
              leading: Image.asset('assets/icons/group.png'),
              title: Text('TEAM')),
          ListTile(
              onTap: () {},
              leading: Image.asset('assets/icons/list.png'),
              title: Text('SERVICES')),
          ListTile(
              onTap: () {},
              leading: Image.asset('assets/icons/call-center.png'),
              title: Text('CONTACT')),
          ListTile(
              onTap: () {},
              leading: Image.asset('assets/icons/career.png'),
              title: Text('CAREERS')),
          ListTile(
              onTap: () {},
              leading: Image.asset('assets/icons/gift.png'),
              title: Text('PRODUCT')),
          ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            blog())); //navigation Blog added

              },
              leading: Image.asset('assets/icons/blogging.png'),
              title: Text('BLOG')),
          Divider(color: Colors.grey, height: 1.0),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
              Widget>[
            Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Connect With Us',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                      textAlign: TextAlign.center)),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                            onTap: () {},
                            child: Image(
                                image:
                                    AssetImage('assets/icons/facebook.png'))),
                        InkWell(
                            onTap: () {},
                            child: Image(
                                image: AssetImage('assets/icons/youtube.png'))),
                        InkWell(
                            onTap: () {},
                            child: Image(
                                image: AssetImage('assets/icons/google.png'))),
                        InkWell(
                            onTap: () {},
                            child: Image(
                                image: AssetImage('assets/icons/twitter.png'))),
                        InkWell(
                            onTap: () {},
                            child: Image(
                                image:
                                    AssetImage('assets/icons/instagram.png')))
                      ]))
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image(
                image: AssetImage('assets/icons/btvlogo.png'),
                height: 120,
              ),
            )
          ]),
        ],
      ),
    );
  }
}
