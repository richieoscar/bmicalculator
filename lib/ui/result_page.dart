import 'package:bmicalculator/components/botttom_container.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const route = '/resultPage';

  String result;
  String bmi;
  String interpration;

  ResultPage({required this.bmi, required this.result,required this.interpration});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Your Result',
                style: kResultTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: KCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: kGrenTextStyle,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    bmi,
                    style: KNumberTextStyle,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpration,
                      textAlign: TextAlign.center,
                      style: kResultSuggestionStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(title: 'RE-CALCULATE', onPressed: () {}),
        ],
      ),
    );
  }
}
