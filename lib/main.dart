import 'package:beat_the_virus/widgets/DrawerItems.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BeatTheVirus()); //Appbar Created
}

class BeatTheVirus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: Drawer(
              child: DrawerItems(),
            ),
            appBar: AppBar(
                title: Text("Beat The Virus"),
                backgroundColor: Color(0xFF82D8FF),
                //backgroundColor: Colors.lightBlueAccent,
                actionsIconTheme: IconThemeData(color: Colors.white),
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
                    icon: Icon(Icons.fastfood),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                }))));
  }
}
