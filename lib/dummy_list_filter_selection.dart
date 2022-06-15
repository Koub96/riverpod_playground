import 'package:flutter_riverpod/flutter_riverpod.dart';

final dummyListFilterSelection = StateProvider<FilterOption>( (ref) => FilterOption.doNotFilter );

enum FilterOption {
  filter,
  doNotFilter
}