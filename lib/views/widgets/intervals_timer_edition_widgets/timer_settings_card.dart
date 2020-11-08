import 'package:baking_timer/views/screens/add_timer_screen.dart';
import 'package:baking_timer/views/widgets/intervals_timer_edition_widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimerSettingsCard extends StatelessWidget {
  final String cardName;
  final CardActivities activity;
  final int value;
  final Function cardCallback;

  TimerSettingsCard({
    this.cardName,
    this.activity,
    this.value,
    this.cardCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 160.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            cardName,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 48.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  cardCallback(
                    activity: activity,
                    action: CardActions.plus,
                  );
                },
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () {
                  cardCallback(
                    activity: activity,
                    action: CardActions.minus,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
