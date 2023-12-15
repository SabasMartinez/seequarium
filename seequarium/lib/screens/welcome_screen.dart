import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seequarium/main.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  SharedPreferences preferences = SharedPreferencesSingleton.preferences!;

  static const welcomeShadow = [
    Shadow(
      blurRadius: 2.5,
      color: Colors.white,
      offset: Offset(0, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('WelcomeScreen:build');
    return OnBoardingSlider(
      finishButtonText: 'Begin',
      // controllerColor: Colors.white,

      onFinish: () {
        preferences.setBool("welcomeDismissed", true);
        context.go('/home');
      },
      headerBackgroundColor: const Color.fromARGB(0, 39, 38, 37),
      background: [
        Image.asset(
          'assets/images/welcome.png',
          height: 400,
          alignment: Alignment.center,
        ),
        Image.asset(
          'assets/images/waterParam.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/identify.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/store.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/dream.png',
          height: 400,
        ),
      ],
      speed: 1.8,
      totalPage: 5,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Welcome to Seequarium!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your personal aquarium assistant.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Keep water parameters in check.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'With predictive water change scheduling.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Find that Fish!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'With livestock identification.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Find your nearest aquarium store.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'You know you want to.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Seequarium',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Helping you achieve your dream aquarium.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: welcomeShadow,
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
