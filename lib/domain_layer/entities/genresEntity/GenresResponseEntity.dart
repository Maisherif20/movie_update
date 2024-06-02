import 'package:untitled/domain_layer/entities/genresEntity/GenresEntity.dart';

class GenresResponseEntity{
  GenresResponseEntity(
  {
    this.genresEntity,
    this.statusMsg,
    this.message,
}
      );
  List<GenresEntity>? genresEntity;
  String? statusMsg;
  String? message;
}