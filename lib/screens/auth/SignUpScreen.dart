import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:beat_the_virus/provider/AuthenticateProvider.dart';
import 'package:beat_the_virus/utility/EmailPasswordHelp.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'EmailVerifyScreen.dart';
import 'LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailTED = TextEditingController(),
      passwordTED = TextEditingController();

  @override
  void dispose() {
    emailTED.dispose();
    passwordTED.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF3d8fa5),
              Color(0xFF76e2ff),
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    shrinkWrap: true,
                    children: [
                  Image.asset(
                    'assets/icons/btvlogolow.png',
                    height: SizeConfig.screenHeight * 0.20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Join our Community',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'AveriaSerifLibre',
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 15)),
                  ),
                  Container(
                      width: SizeConfig.screenWidth * 0.70,
                      height: SizeConfig.screenHeight * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 5.0,
                          child: Form(
                              key: _formKey,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: emailTED,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            labelText: 'Enter Email',
                                            hintText: 'Enter new Email'),
                                        validator: (email) {
                                          if (email.isEmpty ||
                                              !EmailValidator.validate(email)) {
                                            return 'Invalid Email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: TextFormField(
                                        controller: passwordTED,
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            labelText: 'Enter Password',
                                            hintText: 'Enter new Password'),
                                        validator: (password) {
                                          if (password.isEmpty ||
                                              !validatePassword(password)) {
                                            return 'Invalid Password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    if (_isLoading)
                                      CircularProgressIndicator()
                                    else
                                      Column(
                                        children: [
                                          TextButton(
                                              onPressed: () =>
                                                  emailPasswordHelp(context),
                                              child: Text('Need Help ?')),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .blue)),
                                                    onPressed: () => Navigator
                                                            .of(context)
                                                        .pushReplacement(
                                                            MaterialPageRoute(
                                                                builder: (ctx) =>
                                                                    LoginScreen())),
                                                    child: Text(
                                                        'Login Instead ?')),
                                                ElevatedButton(
                                                    //     _createAccountOnPressed(context)
                                                    onPressed: () =>
                                                        createAccount(context),
                                                    child: Text(
                                                        'Create My Account')),
                                              ]),
                                        ],
                                      )
                                  ]))))
                ]))));
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future<void> createAccount(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      // Invalid
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();
    AuthenticateProvider auth =
        Provider.of<AuthenticateProvider>(context, listen: false);
    try {
      SignUpResult result = await auth.registerWithEmaillAndPassword(
          emailTED.text.trim(), passwordTED.text);
      if (result.isSignUpComplete)
        setState(() {
          _isLoading = false;
        });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                EmailConfirmationScreen(email: emailTED.text.trim())),
      );
    } catch (e) {
      _showErrorDialog(e.message);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => AlertDialog(
                title: Row(
                  children: [
                    Text('An Error Occured!'),
                    Icon(Icons.report_problem, color: Colors.red),
                  ],
                ),
                content: Text(message),
                actions: <Widget>[
                  ElevatedButton(
                      child: Text('Okay'),
                      onPressed: () {
                        emailTED.clear();
                        passwordTED.clear();
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.of(ctx).pop();
                      })
                ]));
  }
}
