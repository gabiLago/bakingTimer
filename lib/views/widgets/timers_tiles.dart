import 'package:baking_timer/main.dart';
import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/utils/localized_strings.dart';
import 'package:flutter/material.dart';

class TimersTile extends StatelessWidget {
  final String currentLanguage = BakingTimer.currentLanguage;

  final Timer timerData;
  TimersTile({this.timerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[800],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TimerName(timerData: timerData),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TimerRepeats(
                  timerData: timerData,
                  currentLanguage: currentLanguage,
                ),
                ActivityDuration(
                  timerData: timerData,
                  currentLanguage: currentLanguage,
                ),
                IntervalSeparator(
                  currentLanguage: currentLanguage,
                ),
                PauseDuration(
                  timerData: timerData,
                  currentLanguage: currentLanguage,
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 60.0,
                      color: Colors.green[400],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PauseDuration extends StatelessWidget {
  const PauseDuration(
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
            style: TextStyle(
              fontSize: 48.0,
              color: Colors.grey[50],
            ),
          ),
          Text(
            localizedValues[currentLanguage]['minutes'],
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[50],
            ),
          ),
        ],
      ),
    );
  }
}

class IntervalSeparator extends StatelessWidget {
  const IntervalSeparator({@required this.currentLanguage});

  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      width: 50,
      child: Text(
        localizedValues[currentLanguage]['interval'],
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.orange[400],
        ),
      ),
    );
  }
}

class ActivityDuration extends StatelessWidget {
  const ActivityDuration({
    Key key,
    @required this.timerData,
    @required this.currentLanguage,
  }) : super(key: key);

  final Timer timerData;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: <Widget>[
          Text(
            '${timerData.activityDuration}',
            style: TextStyle(
              fontSize: 48.0,
              color: Colors.grey[50],
            ),
          ),
          Text(
            localizedValues[currentLanguage]['minutes'],
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[50],
            ),
          ),
        ],
      ),
    );
  }
}

class TimerRepeats extends StatelessWidget {
  const TimerRepeats({
    @required this.timerData,
    @required this.currentLanguage,
  });

  final Timer timerData;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[600],
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              '${timerData.numberOfRepeats}',
              style: TextStyle(
                fontSize: 48.0,
                color: Colors.grey[50],
              ),
            ),
            Text(
              localizedValues[currentLanguage]['repeats'],
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.orange[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerName extends StatelessWidget {
  const TimerName({
    @required this.timerData,
  });

  final Timer timerData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Text(
        timerData.timerName,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[50],
        ),
      ),
    );
  }
}
