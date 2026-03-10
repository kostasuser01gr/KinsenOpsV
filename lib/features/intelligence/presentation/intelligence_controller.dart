import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/features/intelligence/domain/models/intelligence.dart';
import 'package:uuid/uuid.dart';

// Current active import batch
final activeImportProvider = StateProvider<ImportBatch?>((ref) => null);

// All AI Suggestions
final aiSuggestionsProvider = StateNotifierProvider<AISuggestionsNotifier, List<AISuggestion>>((ref) {
  return AISuggestionsNotifier();
});

// Audit Logs
final auditLogsProvider = StateNotifierProvider<AuditLogsNotifier, List<AuditLog>>((ref) {
  return AuditLogsNotifier();
});

class AISuggestionsNotifier extends StateNotifier<List<AISuggestion>> {
  AISuggestionsNotifier() : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    state = [
      AISuggestion(
        id: 's1',
        type: 'shift_schedule',
        title: 'Optimize Coordinator Shift',
        reasoning: 'Based on upcoming reservations (15 cars between 14:00-16:00), we suggest an extra Coordinator.',
        suggestedChanges: {
          'action': 'add_shift',
          'user': 'Maria Garcia',
          'time': '13:00-18:00',
        },
        generatedAt: DateTime.now().subtract(const Duration(hours: 1)),
        confidenceScore: 0.92,
      ),
      AISuggestion(
        id: 's2',
        type: 'fleet_priority',
        title: 'Prioritize BMW Cleaning',
        reasoning: 'BAD-9999 has a VIP rental starting in 3 hours and is currently in Maintenance.',
        suggestedChanges: {
          'vehicle': 'BAD-9999',
          'action': 'move_to_cleaning',
        },
        generatedAt: DateTime.now().subtract(const Duration(minutes: 30)),
        confidenceScore: 0.85,
      ),
    ];
  }

  void approveSuggestion(String id) {
    state = [
      for (final s in state)
        if (s.id == id) s.copyWith(status: 'approved') else s,
    ];
  }

  void declineSuggestion(String id) {
    state = [
      for (final s in state)
        if (s.id == id) s.copyWith(status: 'declined') else s,
    ];
  }
}

class AuditLogsNotifier extends StateNotifier<List<AuditLog>> {
  AuditLogsNotifier() : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    state = [
      AuditLog(
        id: 'log1',
        userId: 'u1',
        action: 'import',
        entityType: 'fleet',
        entityId: 'batch_44',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        changes: {'count': 12},
      ),
    ];
  }

  void addLog(AuditLog log) {
    state = [log, ...state];
  }
}

class ImportNotifier extends StateNotifier<List<ImportBatch>> {
  ImportNotifier() : super([]);

  void startImport(String fileName, String fileType, List<String> columns, List<Map<String, String>> data) {
    final newBatch = ImportBatch(
      id: const Uuid().v4(),
      fileName: fileName,
      fileType: fileType,
      uploadedAt: DateTime.now(),
      status: 'pending_mapping',
      detectedColumns: columns,
      rawData: data,
    );
    state = [newBatch, ...state];
  }
}
