import 'package:bmicalculator/constants/color_constants.dart';
import 'package:flutter/material.dart';
class Info extends StatelessWidget {
  final String metric;
  final String title;

  Info({ required this.title, required this.metric});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          metric,
          style: kResultSuggestionStyle,
        ),
        SizedBox(height: 10,),
        Text(
          title,
          style: KLabelTextStyle,
        ),
      ],
    );
  }
}