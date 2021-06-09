import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class AuthenticateProvider with ChangeNotifier {
  bool _isSignedIn = false;
  String _userId = '';

  String get userId {
    return _userId;
  }

  bool get isSigneIn {
    return _isSignedIn;
  }

  Future<void> getUser() async {
    try {
      AuthUser user = await Amplify.Auth.getCurrentUser();
      _userId = user.username;
    } on AuthException catch (e, s) {
      print(e);
      print(s);
      throw e;
    }
  }

  Future<void> fetchUserSession() async {
    try {
      AuthSession res = await Amplify.Auth.fetchAuthSession();
      print('Fetch User Seesion: ' + res.isSignedIn.toString());

      _isSignedIn = res.isSignedIn;

      notifyListeners();
    } on AuthException catch (e, s) {
      print(e);
      print(s);
      throw e;
    }
  }

  Future<void> getUserCredentials() async {
    try {
      CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      print('Fetch User Seesion: ' + res.credentials.awsAccessKey);

      notifyListeners();
    } on AuthException catch (e, s) {
      print(e);
      print(s);
      throw e;
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
      throw e;
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
      throw e;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: email, password: password);

      _isSignedIn = res.isSignedIn;
      notifyListeners();
    } on AuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> reConfirmAccount(String email) async {
    try {
      ResendUserAttributeConfirmationCodeResult res =
          await Amplify.Auth.resendUserAttributeConfirmationCode(
              userAttributeKey: 'email');
    } on AuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
      _isSignedIn = false;
      notifyListeners();
    } on AuthException catch (e, s) {
      print(e);
      print(s);
      throw e;
    }
  }
}
