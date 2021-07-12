import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kvalifika_demo/colors.dart';

class SuccessScreen extends StatelessWidget {
  final bool loading;

  const SuccessScreen({
    Key? key,
    required this.loading,
  }) : super(key: key);

  Widget build(BuildContext context) {
    if (!loading) {
      new Timer(const Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    }

    return Container(
      color: Color(0xFFFFFFFF),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading
                ? CircularProgressIndicator(
                    color: kPrimaryColor,
                  )
                : Icon(
                    Icons.check_circle_rounded,
                    size: 60,
                    color: kPrimaryColor,
                  ),
            SizedBox(
              height: 20,
            ),
            Text(
              loading
                  ? 'Sending email...'
                  : 'Verification Completed. Please check your email',
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
