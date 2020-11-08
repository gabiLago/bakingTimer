import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/viewModel/serial_timer_viewModel.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/views/screens/timers_screen.dart';
import 'package:baking_timer/views/widgets/intervals_timer_edition_widgets/timer_name_card.dart';
import 'package:baking_timer/views/widgets/intervals_timer_edition_widgets/timer_settings_card.dart';

enum CardActivities { timer, pause, repeats }
enum CardActions { plus, minus }

class AddTimerScreen extends StatefulWidget {
  static const String id = 'add_timer_sceen';

  @override
  _AddTimerScreenState createState() => _AddTimerScreenState();
}

class _AddTimerScreenState extends State<AddTimerScreen> {
  final _textFieldController = TextEditingController();

  int timerDuration = 0;
  int pauseDuration = 0;
  int repeats = 0;
  String timerName = '';

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void cardCallback({CardActivities activity, CardActions action}) {
    switch (activity) {
      case CardActivities.timer:
        setState(() {
          if (action == CardActions.plus) {
            timerDuration++;
          } else {
            timerDuration > 0 ? timerDuration-- : timerDuration = 0;
          }
        });
        break;

      case CardActivities.pause:
        setState(() {
          if (action == CardActions.plus) {
            pauseDuration++;
          } else {
            pauseDuration > 0 ? pauseDuration-- : pauseDuration = 0;
          }
        });
        break;

      case CardActivities.repeats:
        setState(() {
          if (action == CardActions.plus) {
            repeats++;
          } else {
            repeats > 0 ? repeats-- : repeats = 0;
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<SerialTimerViewModel>(context).getCurrentLanguage();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          IntervalsTimer newTimer = IntervalsTimer(
              timerName: _textFieldController.text, intervalsTarget: repeats);

          Provider.of<SerialTimerViewModel>(context, listen: false)
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
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TimerNameCard(
                timerName: localizedValues[currentLanguage]
                    ['cardTimerDescription'],
                controller: _textFieldController,
              ),
              TimerSettingsCard(
                cardName: localizedValues[currentLanguage]['cardTimerName'],
                activity: CardActivities.timer,
                value: timerDuration,
                cardCallback: cardCallback,
              ),
              TimerSettingsCard(
                cardName: localizedValues[currentLanguage]['cardPauseName'],
                activity: CardActivities.pause,
                value: pauseDuration,
                cardCallback: cardCallback,
              ),
              TimerSettingsCard(
                cardName: localizedValues[currentLanguage]['cardRepeatsName'],
                activity: CardActivities.repeats,
                value: repeats,
                cardCallback: cardCallback,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
