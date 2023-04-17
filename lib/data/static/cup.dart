import 'package:freezed_annotation/freezed_annotation.dart';

part 'cup.freezed.dart';
part 'cup.g.dart';

@freezed
class Cup with _$Cup {
  const factory Cup({
    required int id,
    required String name,
    required bool additional,
  }) = _Cup;

  factory Cup.fromJson(Map<String, dynamic> json) => _$CupFromJson(json);
}
