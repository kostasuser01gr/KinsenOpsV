import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_controller.dart';
import 'package:kinsen_ops/features/fleet/presentation/station_twin_map.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class FleetScreen extends ConsumerStatefulWidget {
  const FleetScreen({super.key});

  @override
  ConsumerState<FleetScreen> createState() => _FleetScreenState();
}

class _FleetScreenState extends ConsumerState<FleetScreen> {
  int _viewMode = 0; // 0 = List, 1 = Map

  @override
  Widget build(BuildContext context) {
    final vehicles = ref.watch(fleetProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fleet Management',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Manage and monitor your vehicle fleet status',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SegmentedButton<int>(
                      segments: const [
                        ButtonSegment(value: 0, icon: Icon(LucideIcons.list)),
                        ButtonSegment(value: 1, icon: Icon(LucideIcons.map)),
                      ],
                      selected: {_viewMode},
                      onSelectionChanged: (Set<int> newSelection) {
                        setState(() {
                          _viewMode = newSelection.first;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) return AppTheme.primary.withOpacity(0.2);
                          return AppTheme.surface;
                        }),
                        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) return AppTheme.primary;
                          return AppTheme.textSecondary;
                        }),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(LucideIcons.plus),
                      label: const Text('Add Vehicle'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildFleetStats(vehicles),
            const SizedBox(height: 32),
            Expanded(
              child: _viewMode == 0 ? _buildFleetTable(context, vehicles, ref) : const StationTwinMap(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFleetStats(List<Vehicle> vehicles) {
    final cleaning = vehicles.where((v) => v.status == VehicleStatus.cleaning).length;
    final ready = vehicles.where((v) => v.status == VehicleStatus.ready).length;
    final rented = vehicles.where((v) => v.status == VehicleStatus.rented).length;

    return Row(
      children: [
        _StatCard(label: 'Total', value: vehicles.length.toString(), icon: LucideIcons.car),
        const SizedBox(width: 16),
        _StatCard(label: 'Cleaning', value: cleaning.toString(), icon: LucideIcons.droplets, color: Colors.blue),
        const SizedBox(width: 16),
        _StatCard(label: 'Ready', value: ready.toString(), icon: LucideIcons.checkCircle2, color: Colors.green),
        const SizedBox(width: 16),
        _StatCard(label: 'Rented', value: rented.toString(), icon: LucideIcons.key, color: Colors.orange),
      ],
    );
  }

  Widget _buildFleetTable(BuildContext context, List<Vehicle> vehicles, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.divider),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(AppTheme.background),
          columns: const [
            DataColumn(label: Text('Vehicle')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Last Update')),
            DataColumn(label: Text('Fuel')),
            DataColumn(label: Text('Actions')),
          ],
          rows: vehicles.map((v) {
            return DataRow(cells: [
              DataCell(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(v.plate, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(v.model, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  ],
                ),
              ),
              DataCell(_StatusPill(status: v.status)),
              DataCell(Text(DateFormat('HH:mm').format(v.lastStatusUpdate))),
              DataCell(_FuelIndicator(level: v.fuelLevel)),
              DataCell(
                PopupMenuButton<VehicleStatus>(
                  onSelected: (status) => ref.read(fleetProvider.notifier).updateVehicleStatus(v.id, status),
                  itemBuilder: (context) => VehicleStatus.values.map((s) {
                    return PopupMenuItem(value: s, child: Text(s.name.toUpperCase()));
                  }).toList(),
                  child: const Icon(LucideIcons.moreHorizontal),
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const _StatCard({required this.label, required this.value, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.divider),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (color ?? AppTheme.primary).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color ?? AppTheme.primary),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final VehicleStatus status;
  const _StatusPill({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    bool isLive = false;

    switch (status) {
      case VehicleStatus.ready: color = AppTheme.success; break;
      case VehicleStatus.cleaning: color = AppTheme.primary; isLive = true; break;
      case VehicleStatus.returned: color = AppTheme.warning; isLive = true; break;
      case VehicleStatus.maintenance: color = AppTheme.error; break;
      case VehicleStatus.blocked: color = Colors.grey; break;
      default: color = AppTheme.tertiary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
        boxShadow: isLive ? [BoxShadow(color: color.withOpacity(0.2), blurRadius: 8, spreadRadius: 1)] : [],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLive) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            status.name.toUpperCase(),
            style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}

class _FuelIndicator extends StatelessWidget {
  final double level;
  const _FuelIndicator({required this.level});

  @override
  Widget build(BuildContext context) {
    Color color = level > 0.5 ? AppTheme.success : (level > 0.2 ? AppTheme.warning : AppTheme.error);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(LucideIcons.battery, size: 14, color: AppTheme.textSecondary),
        const SizedBox(width: 4),
        SizedBox(
          width: 60,
          child: LinearProgressIndicator(
            value: level,
            backgroundColor: AppTheme.divider,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 4,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text('${(level * 100).toInt()}%', style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

