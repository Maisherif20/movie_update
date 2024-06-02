import 'package:untitled/domain_layer/entities/genresEntity/GenresEntity.dart';

class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
Genres copyWith({  int? id,
  String? name,
}) => Genres(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }


  GenresEntity toGenresEntity(){
    return GenresEntity(
      id: id,
      name: name
    );
  }

}