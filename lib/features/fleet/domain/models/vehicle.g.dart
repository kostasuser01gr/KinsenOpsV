// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vehicle _$VehicleFromJson(Map<String, dynamic> json) => _Vehicle(
  id: json['id'] as String,
  plate: json['plate'] as String,
  model: json['model'] as String,
  status: $enumDecode(_$VehicleStatusEnumMap, json['status']),
  lastStatusUpdate: DateTime.parse(json['lastStatusUpdate'] as String),
  fuelLevel: (json['fuelLevel'] as num).toDouble(),
  mileage: (json['mileage'] as num).toInt(),
  currentDriver: json['currentDriver'] as String?,
  assignedWasherId: json['assignedWasherId'] as String?,
  damagePhotos:
      (json['damagePhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$VehicleToJson(_Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'plate': instance.plate,
  'model': instance.model,
  'status': _$VehicleStatusEnumMap[instance.status]!,
  'lastStatusUpdate': instance.lastStatusUpdate.toIso8601String(),
  'fuelLevel': instance.fuelLevel,
  'mileage': instance.mileage,
  'currentDriver': instance.currentDriver,
  'assignedWasherId': instance.assignedWasherId,
  'damagePhotos': instance.damagePhotos,
  'metadata': instance.metadata,
};

const _$VehicleStatusEnumMap = {
  VehicleStatus.returned: 'returned',
  VehicleStatus.cleaning: 'cleaning',
  VehicleStatus.qc: 'qc',
  VehicleStatus.ready: 'ready',
  VehicleStatus.blocked: 'blocked',
  VehicleStatus.maintenance: 'maintenance',
  VehicleStatus.rented: 'rented',
};

_WashTask _$WashTaskFromJson(Map<String, dynamic> json) => _WashTask(
  id: json['id'] as String,
  vehicleId: json['vehicleId'] as String,
  washerId: json['washerId'] as String,
  preset: $enumDecode(_$WashPresetEnumMap, json['preset']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  finishedAt: json['finishedAt'] == null
      ? null
      : DateTime.parse(json['finishedAt'] as String),
  isQcPassed: json['isQcPassed'] as bool? ?? false,
  qcNotes: json['qcNotes'] as String?,
  reworkReason: json['reworkReason'] as String?,
);

Map<String, dynamic> _$WashTaskToJson(_WashTask instance) => <String, dynamic>{
  'id': instance.id,
  'vehicleId': instance.vehicleId,
  'washerId': instance.washerId,
  'preset': _$WashPresetEnumMap[instance.preset]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'startedAt': instance.startedAt?.toIso8601String(),
  'finishedAt': instance.finishedAt?.toIso8601String(),
  'isQcPassed': instance.isQcPassed,
  'qcNotes': instance.qcNotes,
  'reworkReason': instance.reworkReason,
};

const _$WashPresetEnumMap = {
  WashPreset.basic: 'basic',
  WashPreset.full: 'full',
  WashPreset.express: 'express',
  WashPreset.vip: 'vip',
};
