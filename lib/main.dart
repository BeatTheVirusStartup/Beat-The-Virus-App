import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/AuthenticateProvider.dart';
import './screens/StartPage.dart';
import '../screens/auth/LoginScreen.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => AuthenticateProvider())
    ],
    child: BeatTheVirus(),
  ));
}

Future<void> configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyDataStore(modelProvider: ModelProvider.instance),
    AmplifyStorageS3(),
    AmplifyAPI()
  ]);

  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    print(
        "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}

class BeatTheVirus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticateProvider>(context).isSignedIn;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: auth ? StartPage() : LoginScreen(),
      // FutureBuilder(
      //     future: Amplify.Auth.getCurrentUser(),
      //     builder: (BuildContext context, AsyncSnapshot<AuthUser> snapshot) {
      //       if (snapshot != null && snapshot.hasData) {
      //         return StartPage();
      //       }
      //       return LoginScreen();
      //     }),
    );
  }
}
