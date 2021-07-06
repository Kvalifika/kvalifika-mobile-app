import 'package:flutter/widgets.dart';
import 'package:kvalifika_demo/widgets/kvalifika_logo_with_text.dart';
import 'package:kvalifika_demo/colors.dart';

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
