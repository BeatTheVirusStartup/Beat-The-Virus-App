import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';

enum RadioType { consultant, partner, intern }

class Careers extends StatefulWidget {
  Careers({Key key}) : super(key: key);

  @override
  _CareersState createState() => _CareersState();
}

class _CareersState extends State<Careers> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.centerRight,
          child: Image.asset('assets/images/Ellipse 7.png')),
      Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset('assets/images/Group 27.png')),
      PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: [
          Form1(pageController: pageController),
          Form2(pageController: pageController),
          Form3(pageController: pageController)
        ],
      ),
    ]);
  }
}

class Form1 extends StatefulWidget {
  final PageController pageController;
  Form1({Key key, this.pageController}) : super(key: key);

  @override
  _Form1State createState() => _Form1State(pageController);
}

class _Form1State extends State<Form1> {
  PageController pageController;
  _Form1State(this.pageController);

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
    return Column(children: [
      Expanded(
          child: Container(
              alignment: Alignment.center,
              child: Text(
                'Come\nJoin the Team !',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ))),
      Expanded(
          flex: 3,
          child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
              children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextField(
                        controller: nameTED,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.blue))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                        controller: nameTED,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.school),
                            labelText: 'University/College',
                            labelStyle: TextStyle(color: Colors.blue))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                        controller: nameTED,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_rounded),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.blue))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                        controller: nameTED,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Colors.blue))),
                  ),
                  Container(
                    width: SizeConfig.safeBlockVertical * 15,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: Text(
                        'Next',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: nextPage,
                    ),
                  ),
                ]),
              ])),
    ]);
  }

  void nextPage() {
    pageController.animateToPage(pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
  }
}

class Form2 extends StatefulWidget {
  final PageController pageController;
  Form2({Key key, this.pageController}) : super(key: key);

  @override
  _Form2State createState() => _Form2State(pageController);
}

class _Form2State extends State<Form2> {
  PageController pageController;
  RadioType _site = RadioType.consultant;

  _Form2State(this.pageController);

  String commuValue = 'First';
  List<String> communicationLS = ['First', 'Second', 'Third'];

  String teamWorkValue = 'First';
  List<String> teamWorkLS = ['First', 'Second', 'Third'];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Container(
        alignment: Alignment.center,
        child: Text(
          'Come\nJoin the Team !',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      )),
      Expanded(
          flex: 3,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Whatwould you like to join us as ?',
                            style: Theme.of(context).textTheme.bodyText1),
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
                                style: Theme.of(context).textTheme.bodyText2)
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
                                style: Theme.of(context).textTheme.bodyText2)
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
                                style: Theme.of(context).textTheme.bodyText2)
                          ],
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Communication',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize:
                                    SizeConfig.safeBlockHorizontal * 4.5)),
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
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        commuValue = value;
                                      });
                                    })))
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Team Work',
                            style: Theme.of(context).textTheme.bodyText1),
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        teamWorkValue = value;
                                      });
                                    })))
                      ]),
                ),
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
                                    borderRadius: BorderRadius.circular(15.0))),
                            child: Text(
                              'Back',
                              style: Theme.of(context).textTheme.button,
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
                              style: Theme.of(context).textTheme.button,
                            ),
                            onPressed: nextPage,
                          ),
                        ),
                      )
                    ])
              ]),
            ],
          )),
    ]);
  }

  void nextPage() {
    pageController.animateToPage(pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
  }

  void previousPage() {
    pageController.animateToPage(pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
  }
}

class Form3 extends StatefulWidget {
  final PageController pageController;
  Form3({Key key, this.pageController}) : super(key: key);

  @override
  _Form3State createState() => _Form3State(pageController);
}

class _Form3State extends State<Form3> {
  PageController pageController;

  _Form3State(this.pageController);

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
    return Column(
      children: [
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Text('Come\nJoin the Team !',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6),
        )),
        Expanded(
            flex: 4,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Commitment',
                                style: Theme.of(context).textTheme.bodyText1),
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text('Submit your cover letter or resume',
                                  style: Theme.of(context).textTheme.bodyText1),
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
                                  style: Theme.of(context).textTheme.bodyText1),
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
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
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: checkBoxValue,
                                onChanged: (value) {
                                  setState(() {
                                    checkBoxValue = value;
                                  });
                                }),
                            Text(
                              'Yes',
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                width: SizeConfig.safeBlockVertical * 15,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0))),
                                  child: Text(
                                    'Back',
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  onPressed: previousPage,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                width: SizeConfig.safeBlockVertical * 15,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0))),
                                  child: Text(
                                    'Submit',
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ])
                    ]),
              ],
            )),
      ],
    );
  }

  void previousPage() {
    pageController.animateToPage(pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
  }
}
