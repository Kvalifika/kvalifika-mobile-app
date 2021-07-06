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
        child: Icon(
          Icons.check_circle_rounded,
          size: 100,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
