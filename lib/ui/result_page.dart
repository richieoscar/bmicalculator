import 'package:bmicalculator/components/botttom_container.dart';
import 'package:bmicalculator/components/info.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/constants/color_constants.dart';
import 'package:bmicalculator/ui/input_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const route = '/resultPage';

  String result;
  String bmi;
  String interpration;
  String? height;
  String? age;
  String? weight;

  ResultPage(
      {required this.bmi,
      required this.result,
      required this.interpration,
      this.age,
      this.height,
      this.weight});

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'BMI',
                        style: KLabelTextStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        bmi,
                        style: kBmiTextStyle,
                      ),
                    ],
                  ),
                  Divider(
                    height: 2,
                    color: kWhite,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Info(
                        title: 'Height',
                        metric: height!,
                      ),
                      Info(
                        title: 'Weight',
                        metric: weight!,
                      ),
                      Info(
                        title: 'Age',
                        metric: age!,
                      ),
                    ],
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
          BottomContainer(
              title: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
