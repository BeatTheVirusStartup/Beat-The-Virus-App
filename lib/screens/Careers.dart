import 'package:beat_the_virus/utility/Url_Launcher.dart';
import 'package:flutter/material.dart';

class Careers extends StatefulWidget {
  Careers({Key key}) : super(key: key);

  @override
  _CareersState createState() => _CareersState();
}

class _CareersState extends State<Careers> {
  List<String> contentsLS = [
    'Students',
    'Working Professionals',
    'People willing to explore diverse careers',
    'Partners',
    'Consultants'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Careers Page"),
            elevation: 0,
            backgroundColor: Colors.blue[300]),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue[300],
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Come Join The Team!',
                              style: TextStyle(fontSize: 25.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('BTV welcomes you all',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                        ElevatedButton(
                            onPressed: () => launchURL(
                                'https://docs.google.com/forms/d/e/1FAIpQLScb9EiaifzxiFWe3pWnZ7AJTZLTLbMMqEby9Nomp3-xjT_xfA/viewform'),
                            child: Text('Open the Form')),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: contentsLS.length,
                            itemBuilder: (ctx, index) {
                              return ListTile(
                                  // contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                                  leading: Icon(Icons.check_circle,
                                      color: Colors.green),
                                  title: Text(contentsLS[index]));
                            })
                      ])),
            )));
  }
}
