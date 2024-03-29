import 'package:flutter/material.dart';
import 'package:news/presentation/my_theme.dart';
import 'package:news/presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.screenName: (context) => const HomeScreen(),
      },
      initialRoute: HomeScreen.screenName,
    );
  }
}
