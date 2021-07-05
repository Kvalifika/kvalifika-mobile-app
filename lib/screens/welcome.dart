import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/widgets/kvalifika_logo_with_text.dart';

final kPrimaryColor = Color(0xFF89c35c);

class KvalifikaHeader extends StatelessWidget {
  const KvalifikaHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: KvalifikaLogoWithText(),
          padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
        ),
        Text(
          'Liveness Check',
          style: TextStyle(
            fontSize: 24,
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

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
    return Column(
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
                  style: TextStyle(fontSize: 16, color: Color(0xFF222222)),
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
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle:
                              TextStyle(color: kPrimaryColor, fontSize: 16),
                        ),
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
                          print(_email);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          padding: EdgeInsets.all(18),
                        ),
                        child: Text(
                          'CONTINUE',
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
    );
  }
}
