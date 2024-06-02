import 'package:untitled/domain_layer/entities/genresEntity/GenresResponseEntity.dart';

import 'Genres.dart';

class GenresResponse {
  GenresResponse({
    this.genres,
    this.statusMsg,
    this.message,
  });

  GenresResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

  List<Genres>? genres;
  String? statusMsg;
  String? message;
  GenresResponse copyWith({
    List<Genres>? genres,
  }) =>
      GenresResponse(
        genres: genres ?? this.genres,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  GenresResponseEntity toGenresResponseEntity() {
    return GenresResponseEntity(
        genresEntity: genres?.map((e) => e.toGenresEntity()).toList(),
        statusMsg: statusMsg,
        message: message);
  }
}
