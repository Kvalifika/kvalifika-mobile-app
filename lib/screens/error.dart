import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    new Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });

    return Container(
      color: Color(0xFFFFFFFF),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cancel_rounded,
              size: 80,
              color: kErrorColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Error happened. Please try again',
              style: TextStyle(
                color: kTextColor,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
