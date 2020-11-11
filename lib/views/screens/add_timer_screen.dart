import 'package:baking_timer/models/countdown_timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/viewModel/intervals_timer_viewModel.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/views/screens/timers_screen.dart';
import 'package:baking_timer/views/widgets/intervals_timer_edition_widgets/timer_name_card.dart';
import 'package:baking_timer/views/widgets/intervals_timer_edition_widgets/timer_settings_card.dart';

enum CardActivities { activity, waiting, intervals }
enum CardActions { plus, minus }

class AddTimerScreen extends StatefulWidget {
  static const String id = 'add_timer_sceen';

  @override
  _AddTimerScreenState createState() => _AddTimerScreenState();
}

class _AddTimerScreenState extends State<AddTimerScreen> {
  final _textFieldController = TextEditingController();

  // int timerDuration = 12;
  // int pauseDuration = 0;
  // int repeats = 0;
  String timerName = '';

  Map sectionAction = {
    CardActivities.activity: 0,
    CardActivities.waiting: 0,
    CardActivities.intervals: 0,
  };

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void cardCallback({CardActivities activity, CardActions action}) {
    setState(() {
      if (action == CardActions.plus) {
        sectionAction[activity]++;
      } else {
        sectionAction[activity] > 0
            ? sectionAction[activity]--
            : sectionAction[activity] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<IntervalsTimerViewModel>(context).getCurrentLanguage();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          IntervalsTimer newTimer = IntervalsTimer(
            timerName: _textFieldController.text,
            intervalsTarget: sectionAction[CardActivities.intervals],
            activityTimer: CountdownTimer(
                duration: sectionAction[CardActivities.activity]),
            waitingTimer:
                CountdownTimer(duration: sectionAction[CardActivities.waiting]),
          );

          Provider.of<IntervalsTimerViewModel>(context, listen: false)
              .addTimer(newTimer);
          Navigator.pushNamed(context, TimersScreen.id);
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
      appBar: AppBar(
        title: Text(
          localizedValues[currentLanguage]['title'],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
        child: Center(
          child: Wrap(
            spacing: MediaQuery.of(context).size.width * 0.025,
            children: <Widget>[
              TimerNameCard(
                timerName: localizedValues[currentLanguage]
                    ['cardTimerDescription'],
                controller: _textFieldController,
              ),
              TimerSettingsCard(
                cardName: localizedValues[currentLanguage]['cardTimerName'],
                activity: CardActivities.activity,
                value: sectionAction[CardActivities.activity],
                cardCallback: cardCallback,
              ),
              TimerSettingsCard(
                cardName: localizedValues[currentLanguage]['cardPauseName'],
                activity: CardActivities.waiting,
                value: sectionAction[CardActivities.waiting],
                cardCallback: cardCallback,
              ),
              TimerSettingsCard(
                cardName: localizedValues[currentLanguage]['cardRepeatsName'],
                activity: CardActivities.intervals,
                value: sectionAction[CardActivities.intervals],
                cardCallback: cardCallback,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
