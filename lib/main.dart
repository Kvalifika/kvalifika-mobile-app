import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kvalifika_demo/screens/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      home: Scaffold(
        body: SafeArea(
          child: WelcomeScreen(),
        ),
      ),
    );
  }
}
