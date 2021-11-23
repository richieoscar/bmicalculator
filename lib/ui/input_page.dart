import 'package:bmicalculator/components/botttom_container.dart';
import 'package:bmicalculator/components/icon_content.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/components/round_icon_button.dart';
import 'package:bmicalculator/constants/color_constants.dart';
import 'package:bmicalculator/constants/enums.dart';
import 'package:bmicalculator/main.dart';
import 'package:bmicalculator/service/bmi_calculator_service.dart';
import 'package:bmicalculator/ui/result_page.dart';
import 'package:bmicalculator/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInactiveCardColor;
  Color femaleCardColor = KInactiveCardColor;
  Gender? _gender;
  int height = 120;
  int weight = 65;
  int age = 18;

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseWeight() {
    setState(() {
      weight != 0 ? weight-- : 0;
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  void decreaseAge() {
    setState(() {
      age != 0 ? age-- : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardColor:
                      _gender == Gender.MALE ? KCardColor : KInactiveCardColor,
                  child: const IconContent(
                      icon: FontAwesomeIcons.male, label: "MALE"),
                  onPressed: () {
                    AppLogger.logInfo("Male color changed");
                    setState(() {
                      _gender = Gender.MALE;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardColor: _gender == Gender.FEMALE
                      ? KCardColor
                      : KInactiveCardColor,
                  child: const IconContent(
                      icon: FontAwesomeIcons.female, label: "FEMALE"),
                  onPressed: () {
                    AppLogger.logInfo("Female color changed");
                    setState(() {
                      _gender = Gender.FEMALE;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            child: Expanded(
              child: ReusableCard(
                cardColor: KCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: KLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: KNumberTextStyle),
                        const Text(
                          'cm',
                          style: KLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kSliderWhite,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          thumbColor: KBottomContainerColor,
                          overlayColor: kSliderOverlayColor,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: KSliderinactiveColor,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                            AppLogger.logInfo(newValue.toString());
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardColor: KCardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: KLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: KNumberTextStyle,
                            ),
                            Text(
                              'kg',
                              style: KLabelTextStyle,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  decreaseWeight();
                                },
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  increaseWeight();
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardColor: KCardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: KLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  decreaseAge();
                                },
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  increaseAge();
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          BottomContainer(
            title: "CALCULATE",
            onPressed: () {
              Calculator bmiCalc = Calculator(hieght: height, weight: weight);
              String bmi = bmiCalc.calculateBmi();
              String result = bmiCalc.getResult();
              String interpretation = bmiCalc.getInterpretation();
              AppLogger.logInfo(bmi);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ResultPage(
                          bmi: bmi,
                          result: result,
                          interpration: interpretation)));
            },
          ),
        ],
      ),
    );
  }
}
