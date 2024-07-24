import 'dart:async';

import 'package:parse_json_app/home/data/models/fetch_data_model.dart';
import 'package:parse_json_app/home/data/repositories/fetch_data_repository_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_data_repository.g.dart';

@riverpod
FutureOr<DonutRepository> donutRepository(ref) async {
  final donutLocalDataSource = ref.read(donutRepositoryProvider);
  return DonutRepositoryImp(donutLocalDataSource);
}

abstract class DonutRepository {
  FutureOr<(List<DonutModel>?, String?)> fetchDonuts();
}
