import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.icon,
      @required this.onPressed,
      this.fillColor = const Color(0xFF4C4F5E),
      this.hasElevation = true,
      this.width = 42.0,
      this.height = 42.0});

  final IconData icon;
  final Function onPressed;
  final Color fillColor;
  final bool hasElevation;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: hasElevation ? 6.0 : 0.0,
      constraints: BoxConstraints.tightFor(width: width, height: height),
      shape: CircleBorder(),
      fillColor: fillColor,
    );
  }
}
