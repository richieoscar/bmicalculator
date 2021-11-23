import 'package:bmicalculator/constants/color_constants.dart';
import 'package:bmicalculator/ui/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
         primaryColor:KPrimaryColor,
        scaffoldBackgroundColor: KScafoldBgColor,
        appBarTheme: const AppBarTheme(
           color: KPrimaryColor
        ),
      ),
      home: InputPage(),
    );
  }
}
