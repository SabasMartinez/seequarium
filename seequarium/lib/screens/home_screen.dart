import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:seequarium/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferencesAsync preferences =
      SharedPreferencesSingleton.instance.preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello, <User>!'),
            ElevatedButton(
                onPressed: () => context.go('/maintainance'),
                child: const Text('Log Maintanence')),
            ElevatedButton(
                onPressed: () => context.go('/locate'),
                child: const Text('Locate an aquarium shop!')),
            ElevatedButton(
                onPressed: () => context.go('/identify'),
                child: const Text('Identify Fish')),
            ElevatedButton(
                onPressed: () => context.go('/settings'),
                child: const Text('Settings')),
          ],
        ),
      ),
    );
  }
}
