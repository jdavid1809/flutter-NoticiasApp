import 'package:flutter/material.dart';
import 'package:noticias_app/services/services.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsService>(context);

    return const Scaffold(
      body: Center(
        child: Text('Tabs1Screen'),
      ),
    );
  }
}
