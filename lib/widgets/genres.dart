import 'package:flutter/material.dart';
import 'package:movieapp/bloc/get_genres_bloc.dart';
import 'package:movieapp/model/genre.dart';
import 'package:movieapp/model/genre_response.dart';
import 'package:movieapp/widgets/core/core.dart';
import 'package:movieapp/widgets/genres_list.dart';

class GenresScreen extends StatefulWidget {
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  @override
  void initState() {
    super.initState();
    genresBloc.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: genresBloc.subject.stream,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<GenreResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0)
            return buildErrorWidget(snapshot.data.error);
          return _buildHomeWidget(snapshot.data);
        } else if (snapshot.hasError)
          return buildErrorWidget(snapshot.error);
        else
          return buildLoadingWidget();
      },
    );
  }

  Widget _buildHomeWidget(GenreResponse data) {
    List<Genre> genres = data.genres;
    print(genres);
    if (genres.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return GenresList(genres: genres);
  }
}
