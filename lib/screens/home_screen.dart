import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/style/theme.dart' as Styles;
import 'package:movieapp/widgets/best_movies.dart';
import 'package:movieapp/widgets/genres.dart';
import 'package:movieapp/widgets/now_playing.dart';
import 'package:movieapp/widgets/persons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Styles.Colors.mainColor,
        centerTitle: true,
        title: Text('Movie App'),
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              EvaIcons.searchOutline,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          BestMovies(),
        ],
      ),
    );
  }
}
