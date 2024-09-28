import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/identify_screen.dart';
import 'screens/locate_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/maintenance_screen.dart';

//global key to show child routes.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  // redirect:  doRedirect(),
  // initialLocation: '/welcome',
  routes: [
    ShellRoute(
      builder: (context, state, child) => Scaffold(
        appBar: (matchPath(state.matchedLocation) == "Welcome")
            ? null
            : AppBar(
                title: Text(matchPath(state.matchedLocation)),
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/aquarium1.jpg'),
                    fit: BoxFit.cover,
                  )),
                  child: Text(
                    'Seequarium',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                //welcome is not a tab that is accessible by the user,
                // this is shown once at first start so it should not be in the drawer
                // ListTile(
                //   title: const Text('Welcome'),
                //   onTap: () {
                //     context.go('/welcome');
                //     Navigator.pop(context); // Close the drawer
                //   },
                // ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    context.go('/home');
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Profile'),
                  onTap: () {
                    context.go('/profile');
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Log Maintenance'),
                  onTap: () {
                    context.go('/maintenance');
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Locate'),
                  onTap: () {
                    context.go('/locate');
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Identify'),
                  onTap: () {
                    context.go('/identify');
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    context.go('/settings');
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ],
            ),
          ),
        ),
        body: child,
      ),
      routes: [
        GoRoute(
          name: "Home",
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: "Welcome",
          path: '/welcome',
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/locate',
          builder: (context, state) => const LocateScreen(),
        ),
        GoRoute(
          path: '/identify',
          builder: (context, state) => const IdentifyScreen(),
        ),
        GoRoute(
          path: '/maintenance',
          builder: (context, state) => const MaintenanceScreen(),
        ),
      ],
    )
  ],
);

String matchPath(String path) {
  switch (path) {
    case '/welcome':
      return 'Welcome';
    case '/home':
      return 'Home';
    case '/profile':
      return 'Profile';
    case '/settings':
      return 'Settings';
    case '/locate':
      return 'Locate';
    case '/identify':
      return 'Identify';
    case '/maintenance':
      return 'Log Maintenance';
    default:
      return 'Welcome';
  }
}
