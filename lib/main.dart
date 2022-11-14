import 'package:flutter/material.dart';
import 'package:noticias_app/screens/screens.dart';
import 'package:noticias_app/theme/myTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: miTema,
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
    );
  }
}
