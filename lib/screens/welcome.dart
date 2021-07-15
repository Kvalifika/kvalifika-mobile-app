import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/colors.dart';
import 'package:kvalifika_demo/widgets/email_field.dart';
import 'package:kvalifika_demo/screens/error.dart';
import 'package:kvalifika_demo/screens/success.dart';
import 'package:kvalifika_demo/widgets/kvalifika_header.dart';
import 'package:kvalifika_sdk/kvalifika_sdk.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _email = "";
  // final String _appId = '7bd2bab9-5bcb-4f8d-a0c8-d7fd3fd4653b'; // Production
  final String _appId = '2f1f1edf-b3ba-43c6-855e-f84cb891de45'; // Development
  final _formKey = GlobalKey<FormState>();

  Future<bool> sendMail(String sessionId) async {
    http.Response res = await http.post(
        Uri.parse(
            'https://apidev.kvalifika.com/verification/mobile-pdf/$sessionId'),
        body: jsonEncode({
          'appId': _appId,
          'email': _email,
        }),
        headers: {'Content-Type': 'application/json'});
    return res.statusCode == 201;
  }

  MaterialPageRoute errorPage(context) {
    return new MaterialPageRoute(builder: (context) => ErrorScreen());
  }

  MaterialPageRoute successPage(context, loading) {
    return new MaterialPageRoute(
      builder: (context) => SuccessScreen(loading: loading),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KvalifikaSdk(
      appId: _appId,
      development: true,
      onInitialize: () {},
      onStart: (sessionId) {},
      onFinish: (sessionId) async {
        Navigator.push(context, successPage(context, true));
        final success = await sendMail(sessionId);

        if (success) {
          Navigator.pushReplacement(context, successPage(context, false));
        } else {
          Navigator.pushReplacement(context, errorPage(context));
        }
      },
      onError: (error, message) {
        if (error != KvalifikaSdkError.USER_CANCELLED) {
          Navigator.push(context, errorPage(context));
        }
      },
      locale: KvalifikaSdkLocale.EN,
      builder: (context, sdk) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: KvalifikaHeader(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Please enter your email below. We will send you Kvalifika session data at the end of the process.',
                    style: TextStyle(fontSize: 16, color: kTextColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        EmailField(onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sdk.startSession();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.all(18),
                          ),
                          child: Text(
                            'START SESSION',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
