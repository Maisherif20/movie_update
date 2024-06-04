import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:untitled/constants/Constant.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/data_layer/models/movieDetailsResponse/DetailsResponse.dart';
import '../Models/genresResponse/GenresResponse.dart';
import '../Models/movieDiscoverResponse/MovieDiscoverResponse.dart';
import '../models/MoviesResponse/MovieResponse.dart';
@singleton
@injectable
class ApiManager{
  Future<MovieResponse>getPopularMovies()async{
    var uri=Uri.https(Constant.baseUrl , "/3/movie/popular",{
      "api_key":Constant.apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    MovieResponse popularMovie = MovieResponse.fromJson(json);
    return popularMovie;
  }
  Future<MovieResponse>getNewReleaseMovies()async{
    var uri=Uri.https(Constant.baseUrl , "/3/movie/upcoming",{
      "api_key":Constant.apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    MovieResponse movieResponse = MovieResponse.fromJson(json);
    return movieResponse;
  }
  Future<MovieResponse>getRecommendedMovies()async{
    var uri=Uri.https(Constant.baseUrl , "/3/movie/top_rated",{
      "api_key":Constant.apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    MovieResponse movieResponse = MovieResponse.fromJson(json);
    return movieResponse;
  }
  Future<DetailsResponse>getMoviesDetails(String movieId)async{
    var uri=Uri.https(Constant.baseUrl , "/3/movie/$movieId",{
      "api_key":Constant.apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    DetailsResponse detailsResponse = DetailsResponse.fromJson(json);
    return detailsResponse ;
  }
  Future<MovieResponse>getMoreLike(String movieId)async{
    var uri=Uri.https(Constant.baseUrl , "/3/movie/$movieId/similar",{
      "api_key":Constant.apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    MovieResponse movieResponse = MovieResponse.fromJson(json);
    return movieResponse;
  }

  Future<GenresResponse>getGenresMovies()async{
    var uri=Uri.https(Constant.baseUrl , "/3/genre/movie/list",{
      "api_key":Constant.apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    GenresResponse genresMovies = GenresResponse.fromJson(json);
    return genresMovies;
  }

  Future<MovieDiscoverResponse> getMovieGenreList(int withGenres) async {
    var uri = Uri.https(Constant.baseUrl, "/3/discover/movie", {
      "api_key": Constant.apiKey,
      "with_genres": withGenres.toString(),
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    MovieDiscoverResponse movieGenreList = MovieDiscoverResponse.fromJson(json);
    return movieGenreList;
  }

  Future<MovieResponse> searchForMovie(String query) async {
    var uri = Uri.https(Constant.baseUrl, "/3/search/movie", {
      "api_key": Constant.apiKey,
      "query": query,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    MovieResponse movieResponse = MovieResponse.fromJson(json);
    return movieResponse;
  }
}