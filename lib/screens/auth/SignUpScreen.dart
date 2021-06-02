import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:beat_the_virus/provider/AuthenticateProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    emailTED.dispose();
    passwordTED.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          shrinkWrap: true,
          children: [
            Image.asset(
              'assets/icons/btvlogolow.png',
              height: SizeConfig.screenHeight * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Vivaldi',
                      fontSize: SizeConfig.safeBlockHorizontal * 15)),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.70,
              height: SizeConfig.screenHeight * 0.30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 5.0,
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailTED,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            controller: passwordTED,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (ctx) => LoginScreen())),
                                  child: Text('Go to Login')),
                              OutlinedButton(
                                  //     _createAccountOnPressed(context)
                                  onPressed: () => createAccount(context),
                                  child: Text('Create My Account')),
                            ],
                          )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// void _gotToEmailConfirmationScreen(BuildContext context, String email) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (_) => EmailConfirmationScreen(email: email),
//     ),
//   );
// }

// Future<void> _createAccountOnPressed(BuildContext context) async {
//   FocusScope.of(context).unfocus();

//   if (_formKey.currentState.validate()) {
//     final email = emailTED.text.trim();
//     final password = passwordTED.text;

//     Map<String, String> userAttributes = {"email": email};

//     try {
//       await Amplify.Auth.signUp(
//               username: email,
//               password: password,
//               options: CognitoSignUpOptions(userAttributes: userAttributes))
//           .then((SignUpResult result) {
//         if (result.isSignUpComplete) {
//           _gotToEmailConfirmationScreen(context, email);
//         }
//       });
//     } on AuthException catch (e) {
//       print(e.message);
//     }
//   }
// }
