import 'package:beat_the_virus/main.dart';
import 'package:beat_the_virus/provider/AuthenticateProvider.dart';
import 'package:beat_the_virus/provider/BlogsProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'AboutUs.dart';
import 'BlogsPage.dart';
import 'Careers.dart';
import 'ContactUs.dart';
import 'HomePage.dart';
import 'ProductsPage.dart';
import 'Services.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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

  PageController _pageController;
  int _page = 0;

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: Drawer(
          child: SafeArea(
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
                  title: Consumer<AuthenticateProvider>(
                    builder: (ctx, auth, _) {
                      return Text(auth.userId,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4));
                    },
                  ))),
        ),
        Expanded(
          flex: 3,
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
                    Navigator.pop(context);
                    _pageController.jumpToPage(index);
                  },
                );
              }),
        ),
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
      ]))),
      appBar: AppBar(
          elevation: 0,
          title: Text("Beat The Virus", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => debugPrint("search pressed")),
            Consumer<AuthenticateProvider>(
              builder: (ctx, auth, _) {
                return IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () async {
                      auth.signOut().then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Logged Out..!!'),
                            duration: Duration(seconds: 2),
                          )));
                    });
              },
            ),
          ],
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.fastfood, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          })),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontFamily: 'Vivaldi',
                          fontSize: SizeConfig.safeBlockHorizontal * 15),
                      bodyText1: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 7,
                          color: Colors.black),
                      bodyText2: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 4))),
              child: HomePage()),
          ChangeNotifierProvider.value(
            value: Blogs(),
            child: Theme(
                data: ThemeData(
                    textTheme: TextTheme(
                        headline6: TextStyle(
                            fontFamily: 'Vivaldi',
                            fontSize: SizeConfig.safeBlockHorizontal * 15),
                        headline5: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal * 5),
                        bodyText1: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                        bodyText2: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 3))),
                child: BlogsPage()),
          ),
          Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontFamily: 'Vivaldi',
                          fontSize: SizeConfig.safeBlockHorizontal * 15),
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.safeBlockHorizontal * 5),
                      bodyText2: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.safeBlockHorizontal * 3.5))),
              child: Products()),
          Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontFamily: 'Vivaldi',
                          fontSize: SizeConfig.safeBlockHorizontal * 15),
                      headline5: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: 'Forte',
                          color: Colors.white),
                      bodyText1: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal * 5))),
              child: Services()),
          Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                headline6: TextStyle(
                    fontFamily: 'Vivaldi',
                    fontSize: SizeConfig.safeBlockHorizontal * 15,
                    fontWeight: FontWeight.bold),
                button: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 6,
                    color: Colors.white),
                bodyText1: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    color: Colors.blue),
                bodyText2: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                    color: Colors.blue),
                subtitle1: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 4),
              )),
              child: Careers()),
          Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontFamily: 'Vivaldi',
                          fontSize: SizeConfig.safeBlockHorizontal * 15),
                      bodyText1: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4),
                      bodyText2: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          fontWeight: FontWeight.bold))),
              child: AboutUs()),
          Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontFamily: 'Vivaldi',
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontWeight: FontWeight.bold),
                      headline5: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                      bodyText1: TextStyle(color: Colors.black))),
              child: ContactUs())
        ],
      ),
    );
  }
}
