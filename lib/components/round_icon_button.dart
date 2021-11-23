import 'package:bmicalculator/constants/color_constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  VoidCallback? onPressed;

  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: KCardColor,
        child: Icon(icon),
        elevation: 5.0,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        shape: CircleBorder(),
        onPressed: onPressed);
  }
}
