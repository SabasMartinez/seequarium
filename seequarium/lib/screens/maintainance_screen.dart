import 'package:flutter/material.dart';

class MaintainanceScreen extends StatefulWidget {
  const MaintainanceScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  State<MaintainanceScreen> createState() => _MaintainanceScreenState();
}

class _MaintainanceScreenState extends State<MaintainanceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Log your aquarium maintainance here'),
          ],
        ),
      ),
    );
  }
}
