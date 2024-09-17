import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:skill_week_0/bindings/layout_binding.dart';
import 'package:window_size/window_size.dart';
import 'package:window_manager/window_manager.dart';
import 'mobile_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');
    setWindowMaxSize(const Size(5000, 1000));
    setWindowMinSize(const Size(750, 1000));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skill++ week 0',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00664F)),
        useMaterial3: true,
      ),
      initialRoute:"/",
      getPages: [
        GetPage(name: "/", page: ()=> const Layout(),
          binding: LayoutBinding()
        )
      ],
    );
  }
}


