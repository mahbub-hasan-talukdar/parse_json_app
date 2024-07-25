import 'package:parse_json_app/home/domain/entities/topping_entity.dart';

class ToppingModel {
  Topping toEntity(Map<String, dynamic> json) {
    return Topping(
      id: json['id'],
      type: json['type'],
    );
  }
}
