// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intelligence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImportBatch _$ImportBatchFromJson(Map<String, dynamic> json) => _ImportBatch(
  id: json['id'] as String,
  fileName: json['fileName'] as String,
  fileType: json['fileType'] as String,
  uploadedAt: DateTime.parse(json['uploadedAt'] as String),
  status: json['status'] as String,
  rawData:
      (json['rawData'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList() ??
      const [],
  columnMapping:
      (json['columnMapping'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  detectedColumns:
      (json['detectedColumns'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$ImportBatchToJson(_ImportBatch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'status': instance.status,
      'rawData': instance.rawData,
      'columnMapping': instance.columnMapping,
      'detectedColumns': instance.detectedColumns,
    };

_AISuggestion _$AISuggestionFromJson(Map<String, dynamic> json) =>
    _AISuggestion(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      reasoning: json['reasoning'] as String,
      suggestedChanges: json['suggestedChanges'] as Map<String, dynamic>,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      status: json['status'] as String? ?? 'pending',
      confidenceScore: (json['confidenceScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AISuggestionToJson(_AISuggestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'reasoning': instance.reasoning,
      'suggestedChanges': instance.suggestedChanges,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'status': instance.status,
      'confidenceScore': instance.confidenceScore,
    };

_AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => _AuditLog(
  id: json['id'] as String,
  userId: json['userId'] as String,
  action: json['action'] as String,
  entityType: json['entityType'] as String,
  entityId: json['entityId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  changes: json['changes'] as Map<String, dynamic>,
  correlationId: json['correlationId'] as String?,
);

Map<String, dynamic> _$AuditLogToJson(_AuditLog instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'action': instance.action,
  'entityType': instance.entityType,
  'entityId': instance.entityId,
  'timestamp': instance.timestamp.toIso8601String(),
  'changes': instance.changes,
  'correlationId': instance.correlationId,
};
