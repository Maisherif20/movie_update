import 'ResultEntity.dart';

class MoviesEntity {
  MoviesEntity({
    this.page,
    this.message,
    this.statusMsg,
    this.resultEntity,
    this.totalPages,
    this.totalResults,
  });

  // PopularMoviesEntity.fromJson(dynamic json) {
  //   page = json['page'];
  //   if (json['results'] != null) {
  //     results = [];
  //     json['results'].forEach((v) {
  //       results?.add(Results.fromJson(v));
  //     });
  //   }
  //   totalPages = json['total_pages'];
  //   totalResults = json['total_results'];
  // }
  num? page;
  String? statusMsg;
  String? message;
  List<ResultEntity>? resultEntity;
  num? totalPages;
  num? totalResults;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['page'] = page;
  //   if (results != null) {
  //     map['results'] = results?.map((v) => v.toJson()).toList();
  //   }
  //   map['total_pages'] = totalPages;
  //   map['total_results'] = totalResults;
  //   return map;
  // }
}
