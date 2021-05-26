import 'package:beat_the_virus/provider/AuthenticateProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTED = TextEditingController(),
      passwordTED = TextEditingController();

  void _gotoSignUpScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SignUpScreen()));
  }

  void _login(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      Provider.of<AuthenticateProvider>(context, listen: false)
          .signIn(emailTED.text.trim(), passwordTED.text)
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Successfully Logged In..!!'),
                    duration: Duration(seconds: 2)),
              ));
    }
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
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: [
            Image.asset(
              'assets/icons/btvlogolow.png',
              height: SizeConfig.screenHeight * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Log In',
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
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: emailTED,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Enter Email',
                          ),
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
                          ),
                          validator: (password) {
                            if (password.isEmpty) {
                              return 'Invalid Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed:
                                  // () => _loginButtonOnPressed(context)
                                  () => _login(context),
                              child: Text('Log in')),
                          OutlinedButton(
                              onPressed: () => _gotoSignUpScreen(context),
                              child: Text('Create my Account'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Future<void> _loginButtonOnPressed(BuildContext context) async {
//   FocusScope.of(context).unfocus();
//   if (_formKey.currentState.validate()) {
//     /// Login code
//     try {
//       final email = emailTED.text.trim();
//       final password = passwordTED.text;

//       final response = await Amplify.Auth.signIn(
//         username: email,
//         password: password,
//       );

//       if (response.isSignedIn) {
//         Navigator.of(context)
//             .pushReplacement(MaterialPageRoute(builder: (_) => StartPage()));
//       }
//     } on AuthException catch (e) {
//       print(e.message);
//     }
//   }
// }
