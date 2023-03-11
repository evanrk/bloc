import 'package:flutter/material.dart';

import 'package:bloc/app_state.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Blocks();
  }
}

class Blocks extends StatelessWidget {
  const Blocks({super.key});

  @override
  Widget build(BuildContext context) {
    AppState data = AppStateScope.of(context);
    int minutes = data.minutes;
    int maxHours = data.maxHours;
    int startHour = data.startHour;
    bool selecting = false;

    return Expanded(
      // ListView must be within a given size
      child: GestureDetector(
        child: ListView.builder(
          // changes the scroll physics
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: maxHours * 60 ~/ data.minutes,
          itemBuilder: (BuildContext context, int index) {
            return Block(
              index: index,
              minutes: minutes,
              startHour: startHour,
            );
          },
        ),
        onLongPress: () {
          selecting = !selecting;
          print(selecting);
        },
      ),
    );
  }
}

class Block extends StatefulWidget {
  const Block(
      {Key? key,
      required this.index,
      required this.minutes,
      required this.startHour})
      : super(key: key);
  final int index;
  final int minutes;
  final int startHour;

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  @override
  Widget build(BuildContext context) {
    int minuteTag = widget.minutes * widget.index + widget.startHour * 60;
    // AppState data = AppStateScope.of(context);
    // int minutes = data.minutes * widget.index;
    return Row(
      children: [
        Container(
          alignment: Alignment.topRight,
          width: 50,
          child: Text("$minuteTag"),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(2.0),
            ),
            padding: EdgeInsets.all(widget.minutes * 8 / 5),
            margin: const EdgeInsets.only(top: 2.5, bottom: 2.5, left: 3.0),
            child: const Text("Hello World"),
          ),
        ),
      ],
    );
    ;
  }
}

// class Block extends StatelessWidget {
//   final String time;
//   const Block({Key? key, required this.time}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AppState data = AppStateScope.of(context)!.data;
//     print(data.minutes);
//     return Container();
//   }
// }
