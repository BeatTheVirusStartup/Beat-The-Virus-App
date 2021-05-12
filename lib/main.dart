import 'package:flutter/material.dart';
import 'package:beat_the_virus/screens/StartPage.dart';

void main() {
  runApp(BeatTheVirus()); //Appbar Created
}

class BeatTheVirus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
