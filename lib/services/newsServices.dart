import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

final _URLNews = "https://newsapi.org/v2";
final _APIKEY = "615dcd1e7db641a89c1e5956a22020bb";

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.solidFutbol, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticle = {};

  NewsService() {
    this.getTopHeadLines();
    categories.forEach((item) {
      this.categoryArticle[item.name] = [];
    });
  }

  get selectedCategory => this._selectedCategory;
  set SelectedCategory(String valor) {
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      this.categoryArticle[this.selectedCategory]!;

  getTopHeadLines() async {
    final url = Uri.parse("$_URLNews/top-headlines?apiKey=$_APIKEY&country=mx");
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    // NewsResponse.articles = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticle[category]!.length > 0) {
      return this.categoryArticle[category];
    }
    final url = Uri.parse(
        "$_URLNews/top-headlines?apiKey=$_APIKEY&country=mx&category=${category}");
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    this.categoryArticle[category]!.addAll(newsResponse.articles);

    // NewsResponse.articles = newsResponseFromJson(resp.body);
    notifyListeners();
  }
}
