import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable.freezed.dart';

@freezed
class Pageable<T> with _$Pageable<T> {
  const Pageable._();

  const factory Pageable({
    @Default([]) List<T> data,
    @Default(0) int total,
    @Default(false) bool loading,
  }) = _Pageable<T>;

  bool get canLoadMore {
    return !loading && data.length < total;
  }
}
