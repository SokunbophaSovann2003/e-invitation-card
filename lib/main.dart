import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Roboto",
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: Colors.black,
        )
      ),
      home: const BottomBar(),
    );
  }
}
