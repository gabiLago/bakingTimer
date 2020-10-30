import 'package:baking_timer/main.dart';
import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/models/timers_data.dart';
import 'package:baking_timer/utils/localized_strings.dart';
import 'package:baking_timer/views/screens/add_timer_screen.dart';
import 'package:baking_timer/views/widgets/timers_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimersScreen extends StatelessWidget {
  static const String id = 'timers_sceen';
  final String currentLanguage = BakingTimer.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizedValues[currentLanguage]['title']),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.alarm_add),
            tooltip: 'Add Timer',
            onPressed: () {
              Navigator.pushNamed(context, AddTimerScreen.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            tooltip: 'Edit Timers',
            onPressed: () {
              Navigator.pushNamed(context, AddTimerScreen.id);
            },
          ),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: ListView.builder(
            itemCount: Provider.of<TimersData>(context).timersCount(),
            itemBuilder: (BuildContext context, int index) {
              final timer = Provider.of<TimersData>(context).timers[index];
              return Dismissible(
                key: Key(timer.timerName),
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm"),
                        content: const Text(
                            "Are you sure you wish to delete this item?"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("DELETE")),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("CANCEL"),
                          ),
                        ],
                      );
                    },
                  );
                },
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${timer.timerName} dismissed")));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: Colors.red),
                child: TimersTile(timerData: timer),
              );
            },
          ),
        ),
      ),
    );
  }
}
