import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_controller.dart';
import 'package:kinsen_ops/features/washers/presentation/washers_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WashersKioskScreen extends ConsumerStatefulWidget {
  const WashersKioskScreen({super.key});

  @override
  ConsumerState<WashersKioskScreen> createState() => _WashersKioskScreenState();
}

class _WashersKioskScreenState extends ConsumerState<WashersKioskScreen> {
  final TextEditingController _plateController = TextEditingController();
  WashPreset _selectedPreset = WashPreset.basic;

  void _submit() {
    final plate = _plateController.text.toUpperCase();
    if (plate.isEmpty) return;

    // Find vehicle by plate (mock logic)
    final vehicles = ref.read(fleetProvider);
    final vehicle = vehicles.firstWhere(
      (v) => v.plate.replaceAll('-', '').contains(plate.replaceAll('-', '')),
      orElse: () => vehicles.first, // Fallback for demo
    );

    ref.read(washersProvider.notifier).createTask(vehicle.id, _selectedPreset);
    _plateController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task created for ${vehicle.plate}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Kinsen Wash Kiosk'),
        actions: [
          IconButton(icon: const Icon(LucideIcons.history), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Quick Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _plateController,
              decoration: InputDecoration(
                labelText: 'Vehicle Plate',
                hintText: 'e.g. ZXY-1234',
                filled: true,
                fillColor: AppTheme.surface,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2),
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: 32),
            const Text('Select Wash Type', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: WashPreset.values.map((preset) {
                final isSelected = _selectedPreset == preset;
                return ChoiceChip(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(preset.name.toUpperCase()),
                  ),
                  selected: isSelected,
                  onSelected: (val) => setState(() => _selectedPreset = preset),
                  selectedColor: AppTheme.primary,
                  labelStyle: TextStyle(color: isSelected ? Colors.white : AppTheme.textPrimary),
                );
              }).toList(),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.plusCircle, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  Text('REGISTER WASH', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 48),
            _buildTodaySummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaySummary() {
    final tasks = ref.watch(washersProvider);
    final activeCount = tasks.where((t) => t.finishedAt == null).length;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceGlass,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(label: 'Pending', value: activeCount.toString(), icon: LucideIcons.timer),
          _SummaryItem(label: 'Done Today', value: (tasks.length - activeCount).toString(), icon: LucideIcons.checkCircle),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _SummaryItem({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.textSecondary, size: 20),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
      ],
    );
  }
}
