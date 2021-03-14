import 'package:flutter/material.dart';

class aboutus extends StatefulWidget {
  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us'), backgroundColor: Color(0xFF86CEEB)),
       body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 240,
            child: Stack(
              children: <Widget>[
                Image.network('https://static.wixstatic.com/media/035244_881cbe4617f449cab844cb6a48b5fbeb~mv2_d_2475_2475_s_4_2.jpeg/v1/fill/w_980,h_576,al_c,q_85,usm_0.66_1.00_0.01/035244_881cbe4617f449cab844cb6a48b5fbeb~mv2_d_2475_2475_s_4_2.webp',fit: BoxFit.fill),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('For Preventing Coronavirus and building Long term Health, Beat the Virus Startup through its 400+ Team Members offers Immunity and Health Solutions to Employees and their Families Globally.', style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('We do this by offering 15+ Categories of Immunity Products and Services.', style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Our 400+ Team Members have several decades of Health, Execution and other complimentary aspect.', style: TextStyle(fontSize: 20)),
          ),

        ],
      ),
    );

  }
}

