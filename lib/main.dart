import 'package:flutter/material.dart';

import 'mobile_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skill++ week 0',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff00664F)),
        useMaterial3: true,
      ),
      home: const Layout(title: 'Flutter Demo Home Page'),
    );
  }
}


