import 'package:flutter/material.dart';

class LastUpdateTime extends StatelessWidget {
  const LastUpdateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(TimeOfDay(hour: 19, minute: 38).format(context));
  }
}
