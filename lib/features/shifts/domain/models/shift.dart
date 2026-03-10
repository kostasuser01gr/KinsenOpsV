import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift.freezed.dart';
part 'shift.g.dart';

@freezed
class Shift with _$Shift {
  const factory Shift({
    required String id,
    required String userId,
    required String userName,
    required DateTime startTime,
    required DateTime endTime,
    required String role,
    @Default('published') String status, // draft, published
  }) = _Shift;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
}

@freezed
class ShiftRequest with _$ShiftRequest {
  const factory ShiftRequest({
    required String id,
    required String userId,
    required String type, // leave, swap, availability
    required DateTime startTime,
    required DateTime endTime,
    required String status, // pending, approved, declined
    String? reason,
  }) = _ShiftRequest;

  factory ShiftRequest.fromJson(Map<String, dynamic> json) => _$ShiftRequestFromJson(json);
}
