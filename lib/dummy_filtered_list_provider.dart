import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/dummy_list_filter_selection.dart';
import 'package:riverpod_playground/dummy_list_provider.dart';

final filteredListProvider = Provider<List<String>>((ref) {
  final filter = ref.watch(dummyListFilterSelection);
  final dummyList = ref.watch(dummyItemsProvider);

  switch(filter) {
    case FilterOption.filter:
      return dummyList.where((item) => item.contains("10")).toList();
    case FilterOption.doNotFilter:
      return dummyList;
  }
});