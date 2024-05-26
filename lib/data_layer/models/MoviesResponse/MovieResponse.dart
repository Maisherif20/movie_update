import '../../../domain_layer/entities/MoviesEntity/MoviesEntity.dart';
import 'Results.dart';

class MovieResponse {
  MovieResponse({
    this.page,
    this.message,
    this.statusMsg,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieResponse.fromJson(dynamic json) {
    page = json['page'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  String? statusMsg;
  String? message;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

  MoviesEntity toMoviesEntity() {
    return MoviesEntity(
      page: page,
      statusMsg: statusMsg,
      message: message,
      totalPages: totalPages,
      totalResults: totalResults,
      resultEntity: results?.map((e) => e.toResultEntity()).toList(),
    );
  }
}
