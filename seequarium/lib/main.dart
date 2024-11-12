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
  //15: ensures that widgets are binded used in line 15 to show splash until fully loaded
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //persistent across routes.
  await SharedPreferencesSingleton.instance.init();
  runApp(const Seequarium());
  //checks if it is first run, reroutes to home if not
  entrypoint();
  FlutterNativeSplash.remove();
}

class Seequarium extends StatelessWidget {
  //construct a seequarium object
  const Seequarium({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: darkTheme,
      routerConfig: router,
      title: "Seequarium",
    );
  }
}

void entrypoint() async {
  SharedPreferencesAsync preferences =
      SharedPreferencesSingleton.instance.preferences;
  bool? welcomeDismissed = await preferences.getBool("welcomeDismissed");
  if (welcomeDismissed == false || welcomeDismissed == null) {
    //if first run, route to welcome screen
    router.go("/welcome");
  } else {
    //if not first run, route to home screen
    router.go("/home");
  }
}

//create singleton sharedpreferences
class SharedPreferencesSingleton {
  static final SharedPreferencesSingleton instance =
      SharedPreferencesSingleton._internal();
  late final SharedPreferencesAsync preferences;

//constructor
  SharedPreferencesSingleton._internal();

  Future<void> init() async {
    preferences = SharedPreferencesAsync();
  }
}
