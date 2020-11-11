import 'package:baking_timer/viewModel/intervals_timer_viewModel.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/views/screens/timers_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum CardActivities { timer, pause, repeats }
enum CardActions { plus, minus }

class OtherScreen extends StatelessWidget {
  static const String id = 'other_screen';

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<IntervalsTimerViewModel>(context).getCurrentLanguage();
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
