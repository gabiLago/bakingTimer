import 'package:baking_timer/views/screens/add_timer_screen.dart';
import 'package:baking_timer/views/screens/timers_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/timers_data.dart';

void main() => runApp(BakingTimer());

class BakingTimer extends StatelessWidget {
  static const String currentLanguage = 'en';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimersData(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: TimersScreen(),
        initialRoute: TimersScreen.id,
        routes: {
          TimersScreen.id: (context) => TimersScreen(),
          AddTimerScreen.id: (context) => AddTimerScreen(),
        },
      ),
    );
  }
}
