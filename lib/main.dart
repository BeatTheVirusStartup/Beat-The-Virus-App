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

class BeatTheVirus extends StatefulWidget {
  @override
  _BeatTheVirusState createState() => _BeatTheVirusState();
}

class _BeatTheVirusState extends State<BeatTheVirus> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<AuthenticateProvider>(context).fetchUserSession();
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticateProvider>(
      builder: (ctx, auth, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: auth.isSignedIn ? StartPage() : LoginScreen(),
        );
      },
    );
  }
}
