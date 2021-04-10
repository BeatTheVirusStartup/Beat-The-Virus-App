import 'package:flutter/material.dart';
import 'package:beat_the_virus/screens/btvhomeapp/generatediphone11promax5widget/GeneratedIPhone11ProMax5Widget.dart';

class Home extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Beat The Virus",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black87),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => debugPrint("search pressed")),
            IconButton(
                icon: Icon(Icons.help),
                onPressed: () => debugPrint("help pressed")),
          ],
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.fastfood,
                color: Colors.black87,),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          })
      ),
      body: MaterialApp(
        initialRoute: '/GeneratedIPhone11ProMax5Widget',
        routes: {
          '/GeneratedIPhone11ProMax5Widget': (context) =>
                            GeneratedIPhone11ProMax5Widget(),
      }),

    );
  }

}