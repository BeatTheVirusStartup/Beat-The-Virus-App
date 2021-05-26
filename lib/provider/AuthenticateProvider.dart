import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class AuthenticateProvider with ChangeNotifier {
  bool isSignedIn = false;

  Future<void> fetchUserSession() async {
    try {
      var res = await Amplify.Auth.fetchAuthSession();
      isSignedIn = res.isSignedIn;
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<SignUpResult> registerWithEmaillAndPassword(
      String email, String password) async {
    try {
      Map<String, String> userAttributes = {"email": email};
      final result = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      notifyListeners();
      return result;
    } on AuthException catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<SignUpResult> confirmRegisterWithCode(
      String email, String code) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: code);
      notifyListeners();
      return result;
    } on AuthException catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      Amplify.Auth.signIn(username: email, password: password);
      isSignedIn = true;
      notifyListeners();
    } on AuthException catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<void> signOut() async {
    try {
      Amplify.Auth.signOut();
      isSignedIn = false;
      notifyListeners();
    } on AuthException catch (e, s) {
      print(e);
      print(s);
    }
  }
}
