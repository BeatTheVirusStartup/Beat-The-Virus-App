import 'package:beat_the_virus/widgets/DrawerItems.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      drawer: Drawer(
        child: DrawerItems(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Column(
        children: [
          SizedBox(height:20 ),
          Column(
            children: [
              Padding(padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                     ListTile(
        leading: const Icon(Icons.person),
        title:  TextField(
          decoration:  InputDecoration(
            hintText: "Name",
          ),
        ),
      ),
 ListTile(
        leading: const Icon(Icons.email),
        title:  TextField(
          decoration:  InputDecoration(
            hintText: "Email",
          ),
        ),
      ),
       ListTile(
        leading: const Icon(Icons.subject),
        title:  TextField(
          decoration:  InputDecoration(
            hintText: "Subject",
          ),
        ),
      ),
       ListTile(
        leading: const Icon(Icons.message),
        title:  TextField(
          decoration:  InputDecoration(
            hintText: "Message",
          ),
        ),
      ),
                      
                    ],
                   ),
                  )

            ],),
          SizedBox(height: 10),
          Column(
            children: [
              ElevatedButton(
                  onPressed:(){},
                  child: Text("Submit"),
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)
    )
  )
)
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            children: [
                Text("BEAT THE VIRUS",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
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
              Text("Beat The Virus By Increasing Your Immunity",
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
              Image(image:AssetImage("assets/icons/btvlogo.png"),
              height: 50,
              width:50,
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Text('© 2021 Beat The Virus',
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
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  IconButton(onPressed:(){} ,
                  icon: FaIcon(FontAwesomeIcons.linkedin,size: 30),
                  ),
                  IconButton(onPressed:(){} ,
                    icon: FaIcon(FontAwesomeIcons.youtube,size: 30),
                  ),
                  IconButton(onPressed:(){} ,
                    icon: FaIcon(FontAwesomeIcons.instagram,size: 30),
                  ),
                  IconButton(onPressed:(){} ,
                   icon: FaIcon(FontAwesomeIcons.twitter,size: 30),
                  ),
                  IconButton(onPressed:(){} ,
                   icon: FaIcon(FontAwesomeIcons.facebook,size: 30),
                  ),
                  IconButton(onPressed:(){} ,
                   icon: FaIcon(FontAwesomeIcons.pinterest,size: 30),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
