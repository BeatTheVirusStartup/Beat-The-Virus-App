import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:beat_the_virus/screens/auth/EmailVerifyScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/ModelProvider.dart';
import './provider/AuthenticateProvider.dart';
import './screens/StartPage.dart';
import './utility/Size_Config.dart';
import '../screens/auth/LoginScreen.dart';
import 'amplifyconfiguration.dart';

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
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AuthenticateProvider>(context).fetchUserSession().then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((onError) => print(onError));
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
          home: _isLoading
              ? SplashScreen()
              : auth.isSigneIn
                  ? StartPage()
                  : LoginScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

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
          body: Column(
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/icons/btvlogolow.png',
                  width: SizeConfig.screenWidth * 0.5,
                ),
              )),
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 16,
                        height: SizeConfig.blockSizeVertical * 7,
                        child: CircularProgressIndicator(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Loading....',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 5)),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
