import 'package:untitled/domain_layer/entities/movieDiscoverEntity/result_entity.dart';

class MovieDiscoverEntity{
  MovieDiscoverEntity({
    this.page,
    this.resultEntity,
    this.totalPages,
    this.message,
    this.statusMsg,
    this.totalResults,
});
  int? page;
  String? message;
  String? statusMsg;
  List<ResultEntity>? resultEntity;
  int? totalPages;
  int? totalResults;
}