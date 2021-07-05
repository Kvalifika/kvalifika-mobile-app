import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/widgets/kvalifika_logo_with_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _email;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KvalifikaLogoWithText(),
        Text('Liveness Check'),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Start')),
            ],
          ),
        ),
        Text(
            'Please enter your email below. We will send you Kvalifika session data at the end'),
        TextField(),
      ],
    );
  }
}
