import 'package:bloc_new_app/view/news_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Bloc',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const NewsView(),
    );
  }
}
