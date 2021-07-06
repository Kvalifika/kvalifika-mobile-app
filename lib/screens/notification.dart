import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/colors.dart';

class NotificationScreen extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const NotificationScreen({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
  }) : super(key: key);

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
              icon,
              size: 80,
              color: color,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Verification Completed. Please check your email',
              style: TextStyle(
                color: kTextColor,
                fontSize: 16,
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
