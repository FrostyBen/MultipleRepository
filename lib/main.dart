import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:repository_overview/repository_overview.dart';

void main() {
  preLaunchSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OverviewScreen(),
    );
  }
}
