import 'package:flutter/material.dart';
import 'package:last_artist/Architecture/PresentationLayer/Screens/TSStartupScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Last.fm Artist',
      theme: Theme.of(context).copyWith(primaryColor: Color(0XFF10102c)),
      home: TSStartupScreen(),
    );
  }
}
