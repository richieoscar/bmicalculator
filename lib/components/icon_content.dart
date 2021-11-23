import 'package:bmicalculator/constants/color_constants.dart';
import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: kWhite),
          ),
        ],
      ),
    );
  }
}