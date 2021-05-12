import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUs extends StatefulWidget {
  ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/Group 3.png'),
              )),
              Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/images/Group 1.png'))),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Contact Us',
                      style: TextStyle(
                          fontFamily: 'Vivaldi',
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Subject',
                                prefixIcon: Icon(Icons.subject)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Message',
                                prefixIcon: Icon(Icons.message)),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Submit"),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(children: [
                            Text(
                              "BEAT THE VIRUS",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Beat The Virus By Increasing Your Immunity",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(children: [
                            Image(
                              image: AssetImage("assets/icons/btvlogo.png"),
                              height: 50,
                              width: 50,
                            ),
                            Text(
                              '© 2021 Beat The Virus',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.linkedin, size: 30),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.youtube, size: 30),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  FaIcon(FontAwesomeIcons.instagram, size: 30),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.twitter, size: 30),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.facebook, size: 30),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  FaIcon(FontAwesomeIcons.pinterest, size: 30),
                            ),
                          ],
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
