import 'package:baking_timer/utils/localized_strings.dart';
import 'package:baking_timer/views/utils/style_and_decoration.dart';
import 'package:flutter/material.dart';

class TimerCardIntervalSeparator extends StatelessWidget {
  const TimerCardIntervalSeparator({@required this.currentLanguage});

  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      width: 50,
      child: Text(
        localizedValues[currentLanguage]['interval'],
        style: kBigIntervalStyle(context),
      ),
    );
  }
}
