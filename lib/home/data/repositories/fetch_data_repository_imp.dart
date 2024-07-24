import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:parse_json_app/home/data/data_source/local_data_source.dart';
import 'package:parse_json_app/home/data/models/fetch_data_model.dart';
import 'package:parse_json_app/home/domain/repositories/fetch_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class DonutRepositoryImp implements DonutRepository {
  DonutLocalDataSource donutLocalDataSourceDataSource;

  DonutRepositoryImp(this.donutLocalDataSourceDataSource);

  @override
  FutureOr<(List<DonutModel>?, String?)> fetchDonuts() async {
    return await donutLocalDataSourceDataSource.fetchDonuts();
  }
}
