import 'package:untitled/domain_layer/entities/movieDiscoverEntity/movie_discover_entity.dart';

import 'Results.dart';

class MovieDiscoverResponse {
  MovieDiscoverResponse({
      this.page, 
      this.results, 
      this.totalPages,
    this.message,
    this.statusMsg,
      this.totalResults,});

  MovieDiscoverResponse.fromJson(dynamic json) {
    page = json['page'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  String? message;
  String? statusMsg;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

MovieDiscoverResponse copyWith({  int? page,
  List<Results>? results,
  int? totalPages,
  int? totalResults,
}) => MovieDiscoverResponse(  page: page ?? this.page,
  results: results ?? this.results,
  totalPages: totalPages ?? this.totalPages,
  totalResults: totalResults ?? this.totalResults,
);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    return map;
  }

  MovieDiscoverEntity toMovieDiscoverEntity(){
    return MovieDiscoverEntity(
      page: page,
      message: message,
        statusMsg: statusMsg,
      resultEntity: results?.map((e) => e.toResultEntity()).toList(),
      totalPages: totalPages,
      totalResults :totalResults
    );
  }

}