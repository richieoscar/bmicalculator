import 'dart:math';

class Calculator {
  int hieght;
  int weight;
  double? _bmi;

  Calculator({required this.hieght, required this.weight});

  String calculateBmi() {
    _bmi = weight / pow(hieght/100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25.0) {
      return 'OverWeight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation(){
     if (_bmi! >= 25.0) {
      return 'Your body weight is higher than normal, Please Excersice more';
    } else if (_bmi! > 18.5) {
      return 'Great!, You have a normal body weight';
    } else {
      return "Your body weight is lower than normal, Please eat more";
    }
  }
}
