import 'package:baking_timer/models/intervals_timer_model.dart';
import 'package:baking_timer/localization/localized_strings.dart';
import 'package:baking_timer/viewModel/intervals_timer_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntervalsTimerSeparator extends StatelessWidget {
  const IntervalsTimerSeparator({this.timer, this.fullSize});

  final IntervalsTimer timer;
  final bool fullSize;

  @override
  Widget build(BuildContext context) {
    String currentLanguage =
        Provider.of<IntervalsTimerViewModel>(context).getCurrentLanguage();

    return Container(
      width: fullSize ? MediaQuery.of(context).size.width * 0.18 : 10,
      alignment: Alignment.center,
      child: Text(
        fullSize ? localizedValues[currentLanguage]['interval'] : '/',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
