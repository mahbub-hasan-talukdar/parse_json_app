import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_json_app/home/domain/entities/fetch_data_entity.dart';
import 'package:parse_json_app/home/domain/use_cases/fetch_data_use_case.dart';
import 'package:parse_json_app/home/presentation/riverpod/fetch_data_controller.dart';

class DonutList extends ConsumerStatefulWidget {
  const DonutList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DonutListState();
}

class _DonutListState extends ConsumerState<DonutList> {
  List<DonutEntity>? list = [];

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(fetchDataControllerProvider.notifier).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(fetchDataControllerProvider, (_, next) {
      if (next.value?.$1 != null && next.value?.$2 == null) {
        setState(() {
          list = next.value?.$1;
        });
      } else if (next.value?.$1 == null && next.value?.$2 != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error!'),
              content: Text('${next.value?.$2}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              (list?.isEmpty == true)
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: list?.length,
                        itemBuilder: (BuildContext, index) {
                          return ListTile(
                            title: Text(list?[index].name ?? 'no name'),
                            subtitle:
                                Text(list?[index].ppu.toString() ?? 'no ppu'),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
