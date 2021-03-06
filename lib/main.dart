import 'package:baking_timer/views/screens/add_timer_screen.dart';
import 'package:baking_timer/views/screens/other_screen.dart';
import 'package:baking_timer/views/screens/timers_screen.dart';
import 'package:baking_timer/views/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewModel/intervals_timer_viewModel.dart';

void main() => runApp(BakingTimer());

class BakingTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IntervalsTimerViewModel(),
      child: MaterialApp(
        theme: themeData,
        home: TimersScreen(),
        initialRoute: TimersScreen.id,
        routes: {
          TimersScreen.id: (context) => TimersScreen(),
          AddTimerScreen.id: (context) => AddTimerScreen(),
          OtherScreen.id: (context) => OtherScreen(),
        },
      ),
    );
  }
}
