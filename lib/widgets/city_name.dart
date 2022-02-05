import 'package:flutter/material.dart';

class CityNameWidget extends StatelessWidget {

  final String location;

  CityNameWidget({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(location, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),);
  }
}
