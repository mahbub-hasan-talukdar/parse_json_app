import 'package:parse_json_app/home/domain/entities/fetch_data_entity.dart';

class DonutModel extends DonutEntity {
  DonutModel({
    required super.id,
    required super.type,
    required super.name,
    required super.ppu,
    required super.batters,
    required super.toppings,
  });

  factory DonutModel.fromJson(Map<String, dynamic> json) {
    var data = DonutModel(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      ppu: json['ppu'],
      batters: (json['batters']['batter'] as List)
          .map((b) => BatterModel.fromJson(b))
          .toList(),
      toppings: (json['topping'] as List)
          .map((t) => ToppingModel.fromJson(t))
          .toList(),
    );
    return data;
  }
}

class BatterModel extends Batter {
  BatterModel({
    required super.id,
    required super.type,
  });

  factory BatterModel.fromJson(Map<String, dynamic> json) {
    return BatterModel(
      id: json['id'],
      type: json['type'],
    );
  }
}

class ToppingModel extends Topping {
  ToppingModel({
    required super.id,
    required super.type,
  });

  factory ToppingModel.fromJson(Map<String, dynamic> json) {
    return ToppingModel(
      id: json['id'],
      type: json['type'],
    );
  }
}
