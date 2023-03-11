import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Date(),
    );
  }
}

class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var year = DateTime.parse(now.toString()).year;
    var month = DateTime.parse(now.toString()).month;
    var day = DateTime.parse(now.toString()).day;
    var hour = DateTime.parse(now.toString()).hour;
    var minute = DateTime.parse(now.toString()).minute;

    return Text("$year-$month-$day-$hour-$minute");
  }
}
