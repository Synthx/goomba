import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/data/data.dart';

part 'course.freezed.dart';

part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    required int id,
    required String name,
    required Platform platform,
    required int cupId,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
