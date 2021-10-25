import 'package:flutter/material.dart';
import 'package:hackernews/pages/fetch_and_render_tops.dart';

void main() {
  runApp(const HackerNewsApp());
}
class HackerNewsApp extends StatelessWidget {
  const HackerNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TopNewsPage(),
    );
  }
}
