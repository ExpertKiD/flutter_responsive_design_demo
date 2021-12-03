import 'package:flutter/material.dart';
import 'package:responsivedesign/pages/home.dart';
import 'package:responsivedesign/themes/dark_theme.dart';
import 'package:responsivedesign/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
