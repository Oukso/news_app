import 'package:flutter/material.dart';
import 'package:news_app/src/features/news_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const NewsScreen(),
    );
  }
}
