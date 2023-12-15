import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'theme.dart';
import 'router.dart';

//main entry point
//initializes firebase, sharedpreferences, and removes splash screen
//routes to welcome screen if first run, home screen if not
// Routes are in router.dart, screens and widgets are in lib/screens
void main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //persistent across routes.
  await SharedPreferencesSingleton.createInstance();
  runApp(const Seequarium());
  //checks if it is first run, reroutes to home if not
  entrypoint();
  FlutterNativeSplash.remove();
}

class Seequarium extends StatelessWidget {
  //construct a seequarium object
  const Seequarium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      routerConfig: router,
      title: "Seequarium",
    );
  }
}

void entrypoint() {
  SharedPreferences preferences = SharedPreferencesSingleton.preferences!;
  if (isFirstRun(preferences)) {
    //if first run, route to welcome screen
    router.go("/welcome");
  } else {
    //if not first run, route to home screen
    router.go("/home");
  }
}

bool isFirstRun(SharedPreferences? preferences) {
  if (preferences != null) {
    if (preferences.getBool("welcomeDismissed") == null ||
        preferences.getBool("welcomeDismissed") == false) {
      return true;
    } else {
      return false;
    }
  }
  throw Exception("SharedPreferences is null");
}

//create singleton sharedpreferences
class SharedPreferencesSingleton {
  static SharedPreferencesSingleton? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesSingleton?> createInstance() async {
    _instance ??= SharedPreferencesSingleton();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  static SharedPreferences? get preferences => _preferences;
}
