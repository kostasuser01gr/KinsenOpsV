import 'package:freezed_annotation/freezed_annotation.dart';

part 'intelligence.freezed.dart';
part 'intelligence.g.dart';

@freezed
class ImportBatch with _$ImportBatch {
  const factory ImportBatch({
    required String id,
    required String fileName,
    required String fileType, // 'csv', 'xlsx', 'pdf'
    required DateTime uploadedAt,
    required String status, // 'pending_mapping', 'preview', 'completed', 'failed'
    @Default([]) List<Map<String, String>> rawData,
    @Default({}) Map<String, String> columnMapping,
    @Default([]) List<String> detectedColumns,
  }) = _ImportBatch;

  factory ImportBatch.fromJson(Map<String, dynamic> json) => _$ImportBatchFromJson(json);
}

@freezed
class AISuggestion with _$AISuggestion {
  const factory AISuggestion({
    required String id,
    required String type, // 'shift_schedule', 'fleet_priority', 'washer_queue'
    required String title,
    required String reasoning,
    required Map<String, dynamic> suggestedChanges,
    required DateTime generatedAt,
    @Default('pending') String status, // 'pending', 'approved', 'declined'
    double? confidenceScore,
  }) = _AISuggestion;

  factory AISuggestion.fromJson(Map<String, dynamic> json) => _$AISuggestionFromJson(json);
}

@freezed
class AuditLog with _$AuditLog {
  const factory AuditLog({
    required String id,
    required String userId,
    required String action, // 'create', 'update', 'delete', 'import', 'ai_approve'
    required String entityType,
    required String entityId,
    required DateTime timestamp,
    required Map<String, dynamic> changes, // { 'old': ..., 'new': ... }
    String? correlationId,
  }) = _AuditLog;

  factory AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);
}
