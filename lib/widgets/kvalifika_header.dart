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
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
            child: KvalifikaLogoWithText(),
          ),
          width: 250,
          margin: EdgeInsets.only(top: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Liveness Check',
          style: TextStyle(
            fontSize: 22,
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
