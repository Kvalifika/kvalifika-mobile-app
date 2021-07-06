import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/colors.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KvalifikaSdk(
      appId: "7bd2bab9-5bcb-4f8d-a0c8-d7fd3fd4653b",
      onInitialize: () {},
      onStart: (sessionId) {},
      onFinish: (sessionId) {
        print(_email);
      },
      onError: (error, message) {
        if (error == KvalifikaSdkError.INVALID_APP_ID) {
          print("invalid app id, please provide app id");
        }
      },
      locale: KvalifikaSdkLocale.EN,
      builder: (sdk) => Column(
        children: [
          Flexible(
            child: KvalifikaHeader(),
            flex: 1,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        TextFormField(
                          style: TextStyle(color: kTextColor),
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle:
                                TextStyle(color: kPrimaryColor, fontSize: 16),
                            errorStyle: TextStyle(
                              fontSize: 14,
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kErrorColor),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // sdk.startSession();
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => SuccessScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            padding: EdgeInsets.all(18),
                          ),
                          child: Text(
                            'START SESSION',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
