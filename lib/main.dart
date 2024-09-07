import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:window_manager/window_manager.dart';
import 'mobile_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');
    setWindowMaxSize(const Size(5000, 1000));
    setWindowMinSize(const Size(750, 500));
  }
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


