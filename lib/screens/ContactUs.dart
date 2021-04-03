import 'package:beat_the_virus/widgets/DrawerItems.dart';
import 'package:flutter/material.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerItems(),
      ),
      backgroundColor: Colors.indigo[900],
      body: SingleChildScrollView(
        child:Column(
        children: [
          SizedBox(height:50 ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Text("Subscribe to Our Newsletter",
                style: TextStyle(
                color: Colors.white,
                  fontSize: 20,
          ),
          ),
        ],
      ),
          SizedBox(height:20 ),
          Column(
            children: [
              Padding(padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                            border: OutlineInputBorder(
                            ),
                            labelText: 'Email',
                            hintText: 'Enter Your Email Id',
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
                  color: Colors.white,
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
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Image(image:AssetImage("assets/images/btvlogo.png"),
              height: 100,
              width:100,
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Text('© 2021 Beat The Virus',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Contact with us",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed:(){} ,
                  icon: Image.asset("assets/images/facebook.jpeg"),
                  ),
                  IconButton(onPressed:(){} ,
                    icon: Image.asset("assets/images/twitter.jpeg"),
                  ),
                  IconButton(onPressed:(){} ,
                    icon: Image.asset("assets/images/utube.jpeg"),
                  ),
                  IconButton(onPressed:(){} ,
                    icon: Image.asset("assets/images/pinterest.jpeg"),
                  ),
                  IconButton(onPressed:(){} ,
                    icon: Image.asset("assets/images/t.jpeg"),
                  ),
                  IconButton(onPressed:(){} ,
                    icon: Image.asset("assets/images/insta.jpeg"),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
