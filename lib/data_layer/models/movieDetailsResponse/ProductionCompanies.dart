import 'package:untitled/domain_layer/entities/DetailsEntity/ProductionCompaniesEntity.dart';
import 'package:untitled/domain_layer/entities/DetailsEntity/ProductionCountriesEntity.dart';

class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  num? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

  ProductionCompaniesEntity toProductionCompaniesEntity() {
    return ProductionCompaniesEntity(
        id: id, logoPath: logoPath, name: name, originCountry: originCountry);
  }
}
