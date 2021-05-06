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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back, color: Colors.black, size: 30.0)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Stack(children: [
                  Container(
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
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.person),
                                title: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.email),
                                title: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.subject),
                                title: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Subject",
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.message),
                                title: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Message",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Submit"),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side:
                                            BorderSide(color: Colors.blue))))),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        Text(
                          "BEAT THE VIRUS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Beat The Virus By Increasing Your Immunity",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Image(
                          image: AssetImage("assets/icons/btvlogo.png"),
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Text(
                          '© 2021 Beat The Virus',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
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
                      ],
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Contact Us',
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
