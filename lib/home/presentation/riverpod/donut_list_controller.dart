import 'package:parse_json_app/home/domain/entities/donut_list_entity.dart';
import 'package:parse_json_app/home/domain/repositories/donut_list_repository.dart';
import 'package:parse_json_app/home/domain/use_cases/donut_list_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_data_controller.g.dart';

@riverpod
class FetchDataController extends _$FetchDataController {
  @override
  FutureOr<(List<DonutEntity>?, String?)> build() {
    return (null, null);
  }

  void fetchData() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        return await ref.read(donutUseCaseProvider).execute();
      },
    );
  }
}
