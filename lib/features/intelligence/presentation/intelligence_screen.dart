import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/intelligence/domain/models/intelligence.dart';
import 'package:kinsen_ops/features/intelligence/presentation/intelligence_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';

class IntelligenceScreen extends ConsumerWidget {
  const IntelligenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(aiSuggestionsProvider);
    final logs = ref.watch(auditLogsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, ref),
            const SizedBox(height: 32),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildAISuggestions(context, suggestions, ref),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: _buildAuditLog(context, logs),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Intelligence & Imports',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'AI-driven fleet optimization and enterprise data ingest',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () => _pickAndParseFile(context, ref),
          icon: const Icon(LucideIcons.uploadCloud),
          label: const Text('Import Fleet/Shifts'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }

  Future<void> _pickAndParseFile(BuildContext context, WidgetRef ref) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      final bytes = result.files.first.bytes;
      if (bytes == null) return;
      
      final csvString = utf8.decode(bytes);
      List<List<dynamic>> rows = const CsvToListConverter().convert(csvString);
      
      if (rows.isEmpty) return;

      final headers = rows[0].map((e) => e.toString()).toList();
      final dataRows = rows.skip(1).map((row) {
        Map<String, String> map = {};
        for (var i = 0; i < headers.length; i++) {
          if (i < row.length) {
            map[headers[i]] = row[i].toString();
          }
        }
        return map;
      }).toList();

      _showMappingDialog(context, result.files.first.name, headers, dataRows, ref);
    }
  }

  void _showMappingDialog(BuildContext context, String fileName, List<String> headers, List<Map<String, String>> data, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Import: $fileName'),
        content: SizedBox(
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Detected ${headers.length} columns and ${data.length} rows.', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text('Columns found:'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: headers.map((h) => Chip(label: Text(h, style: const TextStyle(fontSize: 10)))).toList(),
              ),
              const SizedBox(height: 24),
              const Text('Target Module:'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'fleet', child: Text('Fleet Inventory')),
                  DropdownMenuItem(value: 'shifts', child: Text('Shift Schedule')),
                ],
                onChanged: (val) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppTheme.background,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              ref.read(auditLogsProvider.notifier).addLog(AuditLog(
                id: 'log_${DateTime.now().millisecondsSinceEpoch}',
                userId: 'u1',
                action: 'import',
                entityType: 'csv',
                entityId: fileName,
                timestamp: DateTime.now(),
                changes: {'rows': data.length},
              ));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Imported ${data.length} rows successfully.')));
            },
            child: const Text('Start Import'),
          ),
        ],
      ),
    );
  }

  Widget _buildAISuggestions(BuildContext context, List<AISuggestion> suggestions, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('AI Optimization Suggestions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: suggestions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final s = suggestions[index];
              return _AISuggestionCard(suggestion: s, ref: ref);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAuditLog(BuildContext context, List<AuditLog> logs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Audit Trail', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surfaceGlass,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.divider),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      const Icon(LucideIcons.history, size: 14, color: AppTheme.textSecondary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${log.action.toUpperCase()} ${log.entityType}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                            Text(DateFormat('MMM d, HH:mm').format(log.timestamp), style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _AISuggestionCard extends StatelessWidget {
  final AISuggestion suggestion;
  final WidgetRef ref;

  const _AISuggestionCard({required this.suggestion, required this.ref});

  @override
  Widget build(BuildContext context) {
    final isPending = suggestion.status == 'pending';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isPending ? AppTheme.primary.withOpacity(0.3) : AppTheme.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(LucideIcons.sparkles, color: AppTheme.primary, size: 18),
                  const SizedBox(width: 8),
                  Text(suggestion.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              if (suggestion.confidenceScore != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: Text('${(suggestion.confidenceScore! * 100).toInt()}% match', style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(suggestion.reasoning, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
          const SizedBox(height: 16),
          if (isPending)
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => ref.read(aiSuggestionsProvider.notifier).approveSuggestion(suggestion.id),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                  child: const Text('Approve'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => ref.read(aiSuggestionsProvider.notifier).declineSuggestion(suggestion.id),
                  child: const Text('Decline'),
                ),
              ],
            )
          else
            Text(
              suggestion.status.toUpperCase(),
              style: TextStyle(
                color: suggestion.status == 'approved' ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
