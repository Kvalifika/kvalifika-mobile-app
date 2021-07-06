import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

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
              Icons.check_circle_rounded,
              size: 80,
              color: kPrimaryColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Verification Completed. Please check your email',
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
