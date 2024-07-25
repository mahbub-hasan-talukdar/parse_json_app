import 'package:parse_json_app/home/domain/entities/batter_entity.dart';

class BatterModel {
  Batter toEntity(Map<String, dynamic> json) {
    return Batter(
      id: json['id'],
      type: json['type'],
    );
  }
}
