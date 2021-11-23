import 'package:bmicalculator/constants/color_constants.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;

  BottomContainer({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(
              color: KBottomContainerColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          margin:  EdgeInsets.only(top: 20.0),
          width: double.infinity,
          height: KBottomContainerHeight,
          child:  Center(
            child: Text(
              title!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
