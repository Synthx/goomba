import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';

@freezed
class Page<T> with _$Page<T> {
  const factory Page({
    required List<T> content,
    required int numberOfElements,
    required int totalElements,
  }) = _Page<T>;
}
