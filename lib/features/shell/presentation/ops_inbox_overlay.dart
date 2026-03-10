import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/chat/domain/models/chat.dart';
import 'package:kinsen_ops/features/chat/presentation/chat_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class OpsInboxOverlay extends ConsumerWidget {
  const OpsInboxOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(opsInboxProvider);

    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 10)),
        ],
        border: Border.all(color: AppTheme.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Ops Inbox', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('${notifications.length} tasks', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: notifications.isEmpty
                ? const Center(child: Text('All caught up!'))
                : ListView.separated(
                    itemCount: notifications.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final n = notifications[index];
                      return ListTile(
                        leading: _buildSeverityIcon(n.severity),
                        title: Text(n.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(n.message, style: const TextStyle(fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(DateFormat('HH:mm').format(n.timestamp), style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(n.isAcknowledged ? LucideIcons.checkCircle2 : LucideIcons.circle, size: 18, color: n.isAcknowledged ? Colors.green : AppTheme.textSecondary),
                          onPressed: () => ref.read(opsInboxProvider.notifier).acknowledge(n.id),
                        ),
                        isThreeLine: true,
                      );
                    },
                  ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextButton(
              onPressed: () {},
              child: const Center(child: Text('View All Activity')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeverityIcon(String severity) {
    IconData icon;
    Color color;
    switch (severity) {
      case 'urgent': icon = LucideIcons.alertOctagon; color = Colors.red; break;
      case 'error': icon = LucideIcons.alertTriangle; color = Colors.orange; break;
      case 'warning': icon = LucideIcons.info; color = Colors.blue; break;
      default: icon = LucideIcons.bell; color = AppTheme.textSecondary;
    }
    return Icon(icon, color: color, size: 20);
  }
}
