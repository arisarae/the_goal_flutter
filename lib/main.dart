import 'package:flutter/material.dart';
import 'package:the_goal_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green,)
            .copyWith(secondary: Colors.greenAccent[400]),
      ),
      home: MyHomePage(),
    );
  }
}
