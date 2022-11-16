import 'package:flutter/material.dart';

import '../models/models.dart';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() {
    print('Cargando Headlines');
  }
}
