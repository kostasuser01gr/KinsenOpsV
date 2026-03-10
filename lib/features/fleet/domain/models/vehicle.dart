import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

enum VehicleStatus {
  @JsonValue('returned') returned,
  @JsonValue('cleaning') cleaning,
  @JsonValue('qc') qc,
  @JsonValue('ready') ready,
  @JsonValue('blocked') blocked,
  @JsonValue('maintenance') maintenance,
  @JsonValue('rented') rented,
}

enum WashPreset {
  @JsonValue('basic') basic,
  @JsonValue('full') full,
  @JsonValue('express') express,
  @JsonValue('vip') vip,
}

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String plate,
    required String model,
    required VehicleStatus status,
    required DateTime lastStatusUpdate,
    required double fuelLevel, // 0.0 to 1.0
    required int mileage,
    String? currentDriver,
    String? assignedWasherId,
    @Default([]) List<String> damagePhotos,
    @Default({}) Map<String, dynamic> metadata,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}

@freezed
class WashTask with _$WashTask {
  const factory WashTask({
    required String id,
    required String vehicleId,
    required String washerId,
    required WashPreset preset,
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    @Default(false) bool isQcPassed,
    String? qcNotes,
    String? reworkReason,
  }) = _WashTask;

  factory WashTask.fromJson(Map<String, dynamic> json) => _$WashTaskFromJson(json);
}
