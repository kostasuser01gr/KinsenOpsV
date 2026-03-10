import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:uuid/uuid.dart';

final fleetProvider = StateNotifierProvider<FleetNotifier, List<Vehicle>>((ref) {
  return FleetNotifier();
});

class FleetNotifier extends StateNotifier<List<Vehicle>> {
  FleetNotifier() : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    const uuid = Uuid();
    state = [
      Vehicle(
        id: uuid.v4(),
        plate: 'ZXY-1234',
        model: 'Toyota Corolla',
        status: VehicleStatus.returned,
        lastStatusUpdate: DateTime.now().subtract(const Duration(minutes: 45)),
        fuelLevel: 0.25,
        mileage: 45000,
      ),
      Vehicle(
        id: uuid.v4(),
        plate: 'ABC-5678',
        model: 'Ford Focus',
        status: VehicleStatus.cleaning,
        lastStatusUpdate: DateTime.now().subtract(const Duration(minutes: 15)),
        fuelLevel: 0.80,
        mileage: 32000,
        assignedWasherId: 'W1',
      ),
      Vehicle(
        id: uuid.v4(),
        plate: 'KNS-0001',
        model: 'Mercedes E-Class',
        status: VehicleStatus.ready,
        lastStatusUpdate: DateTime.now().subtract(const Duration(hours: 2)),
        fuelLevel: 1.0,
        mileage: 12000,
      ),
      Vehicle(
        id: uuid.v4(),
        plate: 'BAD-9999',
        model: 'BMW 3 Series',
        status: VehicleStatus.maintenance,
        lastStatusUpdate: DateTime.now().subtract(const Duration(days: 1)),
        fuelLevel: 0.1,
        mileage: 89000,
      ),
    ];
  }

  void updateVehicleStatus(String id, VehicleStatus newStatus) {
    state = [
      for (final v in state)
        if (v.id == id) v.copyWith(status: newStatus, lastStatusUpdate: DateTime.now()) else v,
    ];
  }
}
