import 'package:untitled/domain_layer/entities/DetailsEntity/GenresEntity.dart';

class Genres {
  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  GenresEntity toGenresEntity() {
    return GenresEntity(id: id, name: name);
  }
}
