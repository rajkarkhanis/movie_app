import 'package:dio/dio.dart';
import 'package:movieapp/model/cast_response.dart';
import 'package:movieapp/model/genre_response.dart';
import 'package:movieapp/model/movie_detail_response.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:movieapp/model/person_response.dart';
import 'package:movieapp/model/video_response.dart';

class MovieRepository {
  final String apiKey = 'd2fccaf182e8ff1be3ae90d8e5f98212';
  static String mainURL = 'https://api.themoviedb.org/3';
  final Dio _dio = Dio();
  var getPopularURL = '$mainURL/movie/top_rated';
  var getMovieURL = '$mainURL/discover/movie';
  var getPlayingURL = '$mainURL/movie/now_playing';
  var getGenresURL = "$mainURL/genre/movie/list";
  var getPersonsURL = "$mainURL/trending/person/week";
  var getMovieDetailURL = "$mainURL/movie";

  Future<MovieResponse> getPopularMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
      'page': 1,
    };

    try {
      Response response =
          await _dio.get(getPopularURL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error. Stack Trace: $stacktrace');
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
      'page': 1,
    };

    try {
      Response response =
          await _dio.get(getPlayingURL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error. Stack Trace: $stacktrace');
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };

    try {
      Response response = await _dio.get(getGenresURL, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error. Stack Trace: $stacktrace');
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      'api_key': apiKey,
    };

    try {
      Response response =
          await _dio.get(getPersonsURL, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error. Stack Trace: $stacktrace');
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
      'page': 1,
      'with_genres': id,
    };

    try {
      Response response = await _dio.get(getMovieURL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error. Stack Trace: $stacktrace');
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response =
          await _dio.get(getMovieDetailURL + '/$id', queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Error occured: $error. Stack trace: $stacktrace');
      return MovieDetailResponse.withError('$error');
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response = await _dio.get(
          getMovieDetailURL + '/$id' + '/credits',
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Error occured: $error. Stack trace: $stacktrace');
      return CastResponse.withError('$error');
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response = await _dio.get(
          getMovieDetailURL + '/$id' + '/similar',
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Error occured: $error. Stack trace: $stacktrace');
      return MovieResponse.withError('$error');
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };
    try {
      Response response = await _dio.get(getMovieDetailURL + '/$id' + '/videos',
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Error occured: $error. Stack trace: $stacktrace');
      return VideoResponse.withError('$error');
    }
  }
}
