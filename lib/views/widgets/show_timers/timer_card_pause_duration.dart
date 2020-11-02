import 'package:baking_timer/models/timer_model.dart';
import 'package:baking_timer/utils/localized_strings.dart';
import 'package:flutter/material.dart';

class TimerCardPauseDuration extends StatelessWidget {
  const TimerCardPauseDuration(
      {@required this.timerData, @required this.currentLanguage});

  final Timer timerData;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: <Widget>[
          Text(
            '${timerData.pauseDuration}',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            localizedValues[currentLanguage]['minutes'],
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
