import 'package:bmicalculator/constants/color_constants.dart';
import 'package:bmicalculator/constants/enums.dart';
import 'package:bmicalculator/util/logger.dart';
import 'package:bmicalculator/widgets/icon_content.dart';
import 'package:bmicalculator/widgets/reusable_card.dart';
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
                        activeTrackColor: kWhite,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        thumbColor: KBottomContainerColor,
                        overlayColor: Color(0x15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
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
            children: const [
              Expanded(
                child: ReusableCard(
                  cardColor: KCardColor,
                  child:
                      IconContent(icon: FontAwesomeIcons.mars, label: "FEMALE"),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardColor: KCardColor,
                  child:
                      IconContent(icon: FontAwesomeIcons.mars, label: "FEMALE"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: KBottomContainerColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              margin: const EdgeInsets.only(top: 20.0),
              width: double.infinity,
              height: KBottomContainerHeight,
              child: const Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
