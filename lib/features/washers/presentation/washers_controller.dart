import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_controller.dart';
import 'package:uuid/uuid.dart';

final washersProvider = StateNotifierProvider<WashersNotifier, List<WashTask>>((ref) {
  return WashersNotifier(ref);
});

class WashersNotifier extends StateNotifier<List<WashTask>> {
  final Ref _ref;
  WashersNotifier(this._ref) : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    const uuid = Uuid();
    final vehicles = _ref.read(fleetProvider);
    
    if (vehicles.isEmpty) return;

    state = [
      WashTask(
        id: uuid.v4(),
        vehicleId: vehicles[0].id,
        washerId: 'W1',
        preset: WashPreset.full,
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        startedAt: DateTime.now().subtract(const Duration(minutes: 20)),
      ),
      WashTask(
        id: uuid.v4(),
        vehicleId: vehicles[1].id,
        washerId: 'W2',
        preset: WashPreset.basic,
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
    ];
  }

  void createTask(String vehicleId, WashPreset preset) {
    final uuid = const Uuid();
    final newTask = WashTask(
      id: uuid.v4(),
      vehicleId: vehicleId,
      washerId: 'UNASSIGNED',
      preset: preset,
      createdAt: DateTime.now(),
    );
    state = [...state, newTask];
    
    // Update vehicle status to cleaning
    _ref.read(fleetProvider.notifier).updateVehicleStatus(vehicleId, VehicleStatus.cleaning);
  }

  void completeTask(String taskId, {bool qcPassed = true, String? notes}) {
    state = [
      for (final task in state)
        if (task.id == taskId)
          task.copyWith(
            finishedAt: DateTime.now(),
            isQcPassed: qcPassed,
            qcNotes: notes,
          )
        else
          task,
    ];

    final task = state.firstWhere((t) => t.id == taskId);
    if (qcPassed) {
      _ref.read(fleetProvider.notifier).updateVehicleStatus(task.vehicleId, VehicleStatus.ready);
    } else {
      _ref.read(fleetProvider.notifier).updateVehicleStatus(task.vehicleId, VehicleStatus.qc);
    }
  }
}
