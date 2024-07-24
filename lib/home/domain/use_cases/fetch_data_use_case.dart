import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_json_app/home/domain/entities/fetch_data_entity.dart';
import 'package:parse_json_app/home/domain/repositories/fetch_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_data_use_case.g.dart';

@riverpod
DonutUseCase donutUseCase(Ref ref) {
  final donutRepository = ref.read(donutRepositoryProvider);
  return DonutUseCase(donutRepository: donutRepository);
}

class DonutUseCase {
  final DonutRepository donutRepository;

  DonutUseCase({required this.donutRepository});

  FutureOr<(List<DonutEntity>?, String?)> execute() async {
    return await donutRepository.fetchDonuts();
  }
}
