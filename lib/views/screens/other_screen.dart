import 'package:baking_timer/models/intervals_periodic_timer_model.dart';
import 'package:baking_timer/viewModel/intervals_periodic_timers_viewModel.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/views/screens/timers_screen.dart';
import 'package:baking_timer/views/widgets/create_edit_timers/timer_name_card.dart';
import 'package:baking_timer/views/widgets/create_edit_timers/timer_settings_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

enum CardActivities { timer, pause, repeats }
enum CardActions { plus, minus }

class OtherScreen extends StatelessWidget {
  static const String id = 'other_screen';
  final String currentLanguage = BakingTimer.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, TimersScreen.id);
      }),
      appBar: AppBar(
        title: Text(
          localizedValues[currentLanguage]['title'],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text('Other Screen Test'),
        ),
      ),
    );
  }
}
