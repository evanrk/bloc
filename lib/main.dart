import 'package:flutter/material.dart';

import 'package:bloc/app_state.dart';
import 'package:bloc/header.dart';
import 'package:bloc/calendar.dart';
import 'package:bloc/drawer.dart';

// void main() {
//   runApp(AppStateScope(data: AppState(minutes: 0), child: const MyApp()));
// }
void main() {
  runApp(const AppStateWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bloc',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: Container(
          color: Colors.grey,
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Header(),
          ),
        ),
      ),
      endDrawer: const RightDrawer(),
      body: Column(
        children: const [Calendar()],
      ),
    );
  }
}
