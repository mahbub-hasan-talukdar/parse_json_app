import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_json_app/home/data/data_source/local_data_source.dart';
import 'package:parse_json_app/home/data/models/donut_list_model.dart';
import 'package:parse_json_app/home/data/repositories/donut_list_repository_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'donut_list_repository.g.dart';

@riverpod
DonutRepository donutRepository(Ref ref) {
  final donutLocalDataSource = ref.read(donutLocalDataSourceProvider);
  return DonutRepositoryImp(donutLocalDataSource);
}

abstract class DonutRepository {
  FutureOr<(List<DonutModel>?, String?)> fetchDonuts();
}
