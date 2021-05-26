import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:beat_the_virus/provider/AuthenticateProvider.dart';
import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginScreen.dart';

class EmailConfirmationScreen extends StatefulWidget {
  final String email;

  EmailConfirmationScreen({
    Key key,
    @required this.email,
  }) : super(key: key);

  @override
  _EmailConfirmationScreenState createState() =>
      _EmailConfirmationScreenState(email);
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  String email;
  final TextEditingController _confirmationCodeController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _EmailConfirmationScreenState(this.email);

  @override
  void dispose() {
    _confirmationCodeController.dispose();
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                children: [
              Image.asset(
                'assets/icons/btvlogolow.png',
                height: SizeConfig.screenHeight * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Email Confirmation',
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
                      child: Form(
                          key: _formKey,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text:
                                                'An email confirmation code is sent to ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: "'" +
                                                      widget.email +
                                                      "' .",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                  text:
                                                      'Please type the code to confirm your email.',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0))
                                            ])),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _confirmationCodeController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "Enter Confirmation Code"),
                                      validator: (value) => value.length != 6
                                          ? "The confirmation code is invalid"
                                          : null,
                                    ),
                                    Row(
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: Icon(Icons.refresh),
                                            label: Text('Resend Code')),
                                        ElevatedButton(
                                          onPressed: () => _submitCode(context),
                                          child: Text("CONFIRM"),
                                        ),
                                      ],
                                    )
                                  ])))))
            ])));
  }

  Future<void> _submitCode(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      Provider.of<AuthenticateProvider>(context, listen: false)
          .confirmRegisterWithCode(email, _confirmationCodeController.text)
          .then((SignUpResult result) {
        if (result.isSignUpComplete)
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => LoginScreen()));
      });
    }
  }

  // void _resendCode(BuildContext context) async {
  //   if (_formKey.currentState.validate()) {
  //     FocusScope.of(context).unfocus();
  //     await Provider.of<AuthenticateProvider>(context, listen: false)
  //         .resendCode(email)
  //         .then((ResendSignUpCodeResult result) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('Code Sent Successfully'),
  //         duration: Duration(seconds: 2),
  //       ));
  //     });
  //   }
  // }
}

// Future<void> _submitCode(BuildContext context) async {
//   if (_formKey.currentState.validate()) {
//     final confirmationCode = _confirmationCodeController.text;
//     try {
//       final SignUpResult response = await Amplify.Auth.confirmSignUp(
//         username: widget.email,
//         confirmationCode: confirmationCode,
//       );
//       if (response.isSignUpComplete) {
//         _gotoMainScreen(context);
//       }
//     } on AuthException catch (e) {
//       print(e.message);
//     }
//   }
// }
// void _gotoMainScreen(BuildContext context) {
//   Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (_) => LoginScreen()));
// }
