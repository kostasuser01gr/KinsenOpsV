// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shift _$ShiftFromJson(Map<String, dynamic> json) => _Shift(
  id: json['id'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  role: json['role'] as String,
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$ShiftToJson(_Shift instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'userName': instance.userName,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime.toIso8601String(),
  'role': instance.role,
  'status': instance.status,
};

_ShiftRequest _$ShiftRequestFromJson(Map<String, dynamic> json) =>
    _ShiftRequest(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      status: json['status'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ShiftRequestToJson(_ShiftRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'status': instance.status,
      'reason': instance.reason,
    };
