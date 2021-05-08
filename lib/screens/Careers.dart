import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';

PageController _pageController = PageController(initialPage: 0);

class Careers extends StatefulWidget {
  Careers({Key key}) : super(key: key);

  @override
  _CareersState createState() => _CareersState();
}

enum RadioType { consultant, partner, intern }

class _CareersState extends State<Careers> {
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      body: Stack(children: [
        Align(
            alignment: Alignment.centerRight,
            child: Image.asset('assets/images/Ellipse 7.png')),
        Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/Group 27.png')),
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [Form1(), Form2(), Form3()],
        ),
      ]),
    );
  }
}

class Form1 extends StatefulWidget {
  Form1({Key key}) : super(key: key);

  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  TextEditingController nameTED = TextEditingController(),
      uniCollgNameTED = TextEditingController(),
      emailTED = TextEditingController(),
      mobileTED = TextEditingController();

  String nameErrSTR = 'Invalid Name',
      uniCollgErrSTR = 'Invalid University/College Name',
      emailErrSTR = 'Invalid Email',
      mobileErrSTR = 'Invalid Mobile';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                    controller: nameTED,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.blue))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                    controller: nameTED,
                    decoration: InputDecoration(
                        labelText: 'University/College',
                        labelStyle: TextStyle(color: Colors.blue))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                    controller: nameTED,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.blue))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                    controller: nameTED,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.blue))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  width: SizeConfig.safeBlockVertical * 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 6),
                    ),
                    onPressed: nextPage,
                  ),
                ),
              )
            ]),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            child: Text(
              'Careers',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}

class Form2 extends StatefulWidget {
  Form2({Key key}) : super(key: key);

  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  RadioType _site = RadioType.consultant;

  String commuValue = 'First';
  List<String> communicationLS = ['First', 'Second', 'Third'];

  String teamWorkValue = 'First';
  List<String> teamWorkLS = ['First', 'Second', 'Third'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Whatwould you like to join us as ?',
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      color: Colors.blue),
                ),
                Row(
                  children: [
                    Radio(
                      value: RadioType.consultant,
                      groupValue: _site,
                      onChanged: (RadioType value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                    Text('Consultant',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                            color: Colors.blue))
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: RadioType.partner,
                      groupValue: _site,
                      onChanged: (RadioType value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                    Text('Partner',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                            color: Colors.blue))
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: RadioType.intern,
                      groupValue: _site,
                      onChanged: (RadioType value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                    Text('Intern',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                            color: Colors.blue))
                  ],
                ),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Communication',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5)),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          height: 35.0,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  isExpanded: true,
                                  value: commuValue,
                                  items: communicationLS
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  4)),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      commuValue = value;
                                    });
                                  })))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Team Work',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5)),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          height: 35.0,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  isExpanded: true,
                                  value: teamWorkValue,
                                  items: teamWorkLS
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  4)),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      teamWorkValue = value;
                                    });
                                  })))
                    ]),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: SizeConfig.safeBlockVertical * 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6),
                      ),
                      onPressed: previousPage,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: SizeConfig.safeBlockVertical * 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6),
                      ),
                      onPressed: nextPage,
                    ),
                  ),
                )
              ])
            ]),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            child: Text(
              'Careers',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}

class Form3 extends StatefulWidget {
  Form3({Key key}) : super(key: key);

  @override
  _Form3State createState() => _Form3State();
}

class _Form3State extends State<Form3> {
  String commitValue = 'First';
  List<String> commitLS = ['First', 'Second', 'Third'];

  String team1Value = 'First';
  List<String> team1LS = ['First', 'Second', 'Third'];

  String team2Value = 'First';
  List<String> team2LS = ['First', 'Second', 'Third'];

  String declaration =
      "I hereby declare that the above mentioned information is correct to the best of my knowledge and I bear the responsibility for the correctness of the above mentioned particular.";

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Stack(children: [
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Commitment',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.5)),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              height: 35.0,
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      value: commitValue,
                                      items: commitLS
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      4)),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          commitValue = value;
                                        });
                                      })))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text('Submit your cover letter or resume',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4.5)),
                          ),
                          TextButton.icon(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: Colors.grey[350]),
                              onPressed: () {},
                              icon: Icon(Icons.upload_rounded),
                              label: Text('Add File'))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text(
                                'Which Teams(s) are you interested in ?',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4.5)),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              height: 35.0,
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      value: team1Value,
                                      items: team1LS
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      4)),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          team1Value = value;
                                        });
                                      }))),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              height: 35.0,
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      value: team2Value,
                                      items: team2LS
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      4)),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          team2Value = value;
                                        });
                                      }))),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              declaration,
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.5,
                                  color: Colors.black),
                            ),
                          )
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Checkbox(
                          value: checkBoxValue,
                          onChanged: (value) {
                            setState(() {
                              checkBoxValue = value;
                            });
                          }),
                      Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                      )
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              width: SizeConfig.safeBlockVertical * 15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0))),
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 6),
                                ),
                                onPressed: previousPage,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              width: SizeConfig.safeBlockVertical * 15,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0))),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 6),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ])
                  ]),
            )),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Careers',
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 10,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
