import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:untitled/constants/Constant.dart';
import 'package:http/http.dart' as http;

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
    MovieResponse popularMovie = MovieResponse.fromJson(json);
    return popularMovie;
  }
  Future<MovieResponse>getRecommendedMovies()async{
    var uri=Uri.https(Constant.baseUrl , "/3/movie/top_rated",{
      "api_key":Constant.apiKey
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    MovieResponse popularMovie = MovieResponse.fromJson(json);
    return popularMovie;
  }
}