import 'package:flutter/material.dart';
import '../aboutus.dart';
import '../blog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        child: Icon(
                          Icons.person,
                          size: 80.0,
                          color: Colors.black87,
                        )
                    )
                )
                ,
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
              leading: Icon(
                Icons.home,
                size: 34.0,
                color: Colors.black87
              ),
              title: Text('HOME')),
          ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            aboutus())); //navigation aboutus added
              },
              leading: Icon(
                Icons.info_outlined,
                size: 32.0,
                color: Colors.black87
              ),
              title: Text('ABOUT')),
          ListTile(
              onTap: () {},
              leading: Icon(
                Icons.people_alt,
                size: 32.0,
                color: Colors.black87
              ),
              title: Text('TEAM')),
          ListTile(
              onTap: () {},
              leading: Icon(
                Icons.miscellaneous_services,
                size: 32.0,
                color: Colors.black87
              ),
              title: Text('SERVICES')),
          ListTile(
              onTap: () {},
              leading: Icon(
                Icons.support_agent,
                size: 32.0,
                color: Colors.black87
              ),
              title: Text('CONTACT')),
          ListTile(
              onTap: () {},
              leading: Icon(
                  Icons.trending_up,
                  size: 32.0,
                  color: Colors.black87
              ),
              title: Text('CAREERS')),
          ListTile(
              onTap: () {},
              leading: Icon(
                  Icons.add_shopping_cart,
                  size: 32.0,
                  color: Colors.black87
              ),
              title: Text('PRODUCT')),
          ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            blog())); //navigation Blog added

              },
              leading: Icon(
                  FontAwesomeIcons.blog,
                  size: 32.0,
                  color: Colors.black87
              ),
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
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              size: 32,
                            )),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              FontAwesomeIcons.youtube,
                              size: 32,
                            )),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              FontAwesomeIcons.envelope,
                              size: 32,
                            )),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              size: 32,
                            )),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              size: 32,
                            ))
                      ]))
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
