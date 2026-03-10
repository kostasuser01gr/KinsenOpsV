import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_controller.dart';
import 'package:kinsen_ops/features/washers/presentation/washers_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class WashersScreen extends ConsumerWidget {
  const WashersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(washersProvider);
    final vehicles = ref.watch(fleetProvider);

    final activeTasks = tasks.where((t) => t.finishedAt == null).toList();
    final historyTasks = tasks.where((t) => t.finishedAt != null).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            _buildWashersStats(tasks),
            const SizedBox(height: 32),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildTaskQueue(context, activeTasks, vehicles, ref),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: _buildHistory(context, historyTasks, vehicles),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Washers Dashboard',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Monitor throughput and quality control for fleet cleaning',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildWashersStats(List<WashTask> tasks) {
    final todayCount = tasks.where((t) => t.finishedAt != null).length;
    final qcFailRate = todayCount == 0 
        ? 0.0 
        : (tasks.where((t) => t.finishedAt != null && !t.isQcPassed).length / todayCount) * 100;

    return Row(
      children: [
        _WashStatCard(label: 'Today Cleaned', value: todayCount.toString(), icon: LucideIcons.checkCircle2, color: Colors.green),
        const SizedBox(width: 16),
        _WashStatCard(label: 'Avg. Clean Time', value: '22m', icon: LucideIcons.timer, color: Colors.blue),
        const SizedBox(width: 16),
        _WashStatCard(label: 'QC Fail Rate', value: '${qcFailRate.toStringAsFixed(1)}%', icon: LucideIcons.alertTriangle, color: Colors.red),
      ],
    );
  }

  Widget _buildTaskQueue(BuildContext context, List<WashTask> tasks, List<Vehicle> vehicles, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Current Task Queue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.divider),
            ),
            child: tasks.isEmpty
                ? const Center(child: Text('No active cleaning tasks'))
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: tasks.length,
                    separatorBuilder: (_, __) => const Divider(height: 24),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      final vehicle = vehicles.firstWhere((v) => v.id == task.vehicleId);
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppTheme.primary.withOpacity(0.1),
                          child: const Icon(LucideIcons.droplets, color: AppTheme.primary, size: 20),
                        ),
                        title: Text(vehicle.plate, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${vehicle.model} • ${task.preset.name.toUpperCase()}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              DateFormat('HH:mm').format(task.createdAt),
                              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () => ref.read(washersProvider.notifier).completeTask(task.id),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.withOpacity(0.1),
                                foregroundColor: Colors.green,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Complete & QC'),
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

  Widget _buildHistory(BuildContext context, List<WashTask> tasks, List<Vehicle> vehicles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surfaceGlass,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.divider),
            ),
            child: tasks.isEmpty
                ? const Center(child: Text('No history today'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      final vehicle = vehicles.firstWhere((v) => v.id == task.vehicleId);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(vehicle.plate, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                Text(DateFormat('HH:mm').format(task.finishedAt!), style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
                              ],
                            ),
                            Icon(
                              task.isQcPassed ? LucideIcons.checkCircle : LucideIcons.xCircle,
                              color: task.isQcPassed ? Colors.green : Colors.red,
                              size: 16,
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

class _WashStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _WashStatCard({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 16),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
