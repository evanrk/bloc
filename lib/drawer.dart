import "package:flutter/material.dart";

import 'package:bloc/app_state.dart';

class RightDrawer extends StatelessWidget {
  const RightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Text("Options"),
          ),
          Padding(
            // cannot be in a listTile
            padding: EdgeInsets.all(8.0),
            child: MinutesInput(),
          ),
          Padding(
            // cannot be in a listTile
            padding: EdgeInsets.all(8.0),
            child: StartHourInput(),
          ),
          Padding(
            // cannot be in a listTile
            padding: EdgeInsets.all(8.0),
            child: MaxHoursInput(),
          ),
        ],
      ),
    );
  }
}

class MinutesInput extends StatefulWidget {
  const MinutesInput({super.key});

  @override
  State<MinutesInput> createState() => _MinutesInputState();
}

class _MinutesInputState extends State<MinutesInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        // border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(2.0),
        labelText: "Minutes",
      ),
      onSubmitted: (minutes) {
        if (minutes.isNotEmpty) {
          AppStateWidget.of(context).setMinutes(int.parse(minutes));
          print("Minutes: $minutes");
        }
      },
    );
  }
}

class StartHourInput extends StatefulWidget {
  const StartHourInput({super.key});

  @override
  State<StartHourInput> createState() => _StartHourInputState();
}

class _StartHourInputState extends State<StartHourInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        // border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(2.0),
        labelText: "Start Hour",
      ),
      onSubmitted: (startHour) {
        if (startHour.isNotEmpty) {
          AppStateWidget.of(context).setStartHour(int.parse(startHour));
          print("Start Hour: $startHour");
        }
      },
    );
  }
}

class MaxHoursInput extends StatefulWidget {
  const MaxHoursInput({super.key});

  @override
  State<MaxHoursInput> createState() => _MaxHoursInputState();
}

class _MaxHoursInputState extends State<MaxHoursInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        // border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(2.0),
        labelText: "Max Hours",
      ),
      onSubmitted: (maxHours) {
        if (maxHours.isNotEmpty) {
          AppStateWidget.of(context).setMaxHours(int.parse(maxHours));
          print("Max Hours: $maxHours");
        }
      },
    );
  }
}
