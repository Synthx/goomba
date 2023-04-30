import 'package:freezed_annotation/freezed_annotation.dart';

part 'lazy_state.freezed.dart';

@freezed
class LazyState<T> with _$LazyState<T> {
  const LazyState._();

  const factory LazyState({
    required T data,
    required bool loading,
  }) = _LazyState<T>;

  bool get canLoadMore {
    return !loading;
  }
}
