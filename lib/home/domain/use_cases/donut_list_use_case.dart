import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_json_app/home/domain/entities/donut_list_entity.dart';
import 'package:parse_json_app/home/domain/repositories/donut_list_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'donut_list_use_case.g.dart';

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
