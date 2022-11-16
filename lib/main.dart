import 'package:flutter/material.dart';
import 'package:noticias_app/screens/screens.dart';
import 'package:noticias_app/services/newsServices.dart';
import 'package:noticias_app/theme/myTheme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsScreen(),
      ),
    );
  }
}
