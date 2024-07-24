import 'package:flutter/foundation.dart';

class DonutEntity {
  final String id;
  final String type;
  final String name;
  final double ppu;
  final List<Batter> batters;
  final List<Topping> toppings;

  DonutEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.ppu,
    required this.batters,
    required this.toppings,
  });
}

class Batter {
  final String id;
  final String type;

  Batter({
    required this.id,
    required this.type,
  });
}

class Topping {
  final String id;
  final String type;

  Topping({
    required this.id,
    required this.type,
  });
}
