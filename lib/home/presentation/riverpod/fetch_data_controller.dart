import 'package:parse_json_app/home/domain/entities/fetch_data_entity.dart';
import 'package:parse_json_app/home/domain/repositories/fetch_data_repository.dart';
import 'package:parse_json_app/home/domain/use_cases/fetch_data_use_case.dart';
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
    state = await AsyncValue.guard(() async {
      print('before call');
      var res;
      try {
        res = await ref.read(donutUseCaseProvider).execute();
      } catch (e) {
        print(e);
      }
      print('after call');
      return res;
    });
  }
}
