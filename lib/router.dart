import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/welcome.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/profile/:id',
      pageBuilder: (context, state) => ProfileScreen(id: state.params['id']),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => SettingsScreen(),
    ),
  ],
);
