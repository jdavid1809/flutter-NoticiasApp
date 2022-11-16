import 'package:flutter/material.dart';
import 'package:noticias_app/services/services.dart';
import 'package:noticias_app/widgets/listaNoticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    // newsServices.headlines;

    return Scaffold(
      body: ListaNoticias(headlines),
    );
  }
}
