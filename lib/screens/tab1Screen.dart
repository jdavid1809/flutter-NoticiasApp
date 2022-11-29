import 'package:flutter/material.dart';
import 'package:noticias_app/services/services.dart';
import 'package:noticias_app/widgets/listaNoticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    // newsServices.headlines;

    return Scaffold(
      body: (headlines.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListaNoticias(headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
