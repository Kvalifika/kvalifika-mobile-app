import 'package:flutter/material.dart';
import 'package:kvalifika_demo/widgets/kvalifika_logo_with_text.dart';
import 'package:kvalifika_sdk/kvalifika_sdk.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kvalifika'),
        ),
        body: Column(
          children: [
            KvalifikaLogoWithText(),
            KvalifikaSdk(
              appId: "7bd2bab9-5bcb-4f8d-a0c8-d7fd3fd4653b",
              onInitialize: () {},
              onStart: (sessionId) {},
              onFinish: (sessionId) {},
              onError: (error, message) {
                if (error == KvalifikaSdkError.INVALID_APP_ID) {
                  print("invalid app id, please provide app id");
                }
              },
              locale: KvalifikaSdkLocale.EN,
              builder: (sdk) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    sdk.startSession();
                  },
                  child: Text('Start Verification'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
