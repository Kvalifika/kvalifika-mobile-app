import 'package:flutter/material.dart';
import 'package:kvalifika_demo/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: SafeArea(
          child: WelcomeScreen(),
        ),
      ),
    );
  }
}
