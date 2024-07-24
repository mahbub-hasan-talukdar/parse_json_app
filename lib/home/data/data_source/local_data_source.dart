import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_json_app/home/data/models/fetch_data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_data_source.g.dart';

@riverpod
DonutLocalDataSource donutLocalDataSource(Ref ref) {
  return DonutLocalDataSource();
}

class DonutLocalDataSource {
  FutureOr<(List<DonutModel>?, String?)> fetchDonuts() async {
    final String response = await rootBundle.loadString('assets/donuts.json');
    final data = json.decode(response) as List;
    var res = data.map((json) => DonutModel.fromJson(json)).toList();
    return (res, null);
  }
}
