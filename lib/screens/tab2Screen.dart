import 'package:flutter/material.dart';
import 'package:noticias_app/models/models.dart';
import 'package:noticias_app/services/services.dart';
import 'package:noticias_app/theme/myTheme.dart';
import 'package:noticias_app/widgets/listaNoticias.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListaCategorias(),
            Expanded(
              child:
                  ListaNoticias(newsService.getArticulosCategoriaSeleccionada),
            )
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;

          return Container(
            width: 110,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButtom(categories[index]),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButtom extends StatelessWidget {
  final Category categoria;

  const _CategoryButtom(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.SelectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (newsService.selectedCategory != this.categoria.name)
                ? Colors.black54
                : miTema.accentColor),
        child: Icon(
          categoria.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
