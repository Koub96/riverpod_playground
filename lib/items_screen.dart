import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/dummy_filtered_list_provider.dart';
import 'package:riverpod_playground/dummy_list_filter_selection.dart';
import 'package:riverpod_playground/dummy_list_provider.dart';

class ItemsScreen extends ConsumerWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dummyItems = ref.watch(filteredListProvider);
    final filterType = ref.watch(dummyListFilterSelection);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Riverpod Playground! Have Fun!"),
          elevation: 0,
        ),
        body: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dummyItems[index]),
                );
              },
            itemCount: dummyItems.length,
          ),
        floatingActionButton: FloatingActionButton(
          onPressed:() {
            switch(filterType) {
              case FilterOption.filter:
                ref.read(dummyListFilterSelection.notifier).state = FilterOption.doNotFilter;
                break;
              case FilterOption.doNotFilter:
                ref.read(dummyListFilterSelection.notifier).state = FilterOption.filter;
                break;
            }
          },
          child: const Icon(Icons.arrow_circle_down),
        ),
    );
  }
}
