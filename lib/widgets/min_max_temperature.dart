import 'package:flutter/material.dart';

class MinMaxTemperature extends StatelessWidget {
  const MinMaxTemperature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _max = 12, _min = 3;
    return Text('${_max}/${_min}');
  }
}
