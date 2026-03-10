import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/features/shifts/domain/models/shift.dart';
import 'package:uuid/uuid.dart';

final shiftsProvider = StateNotifierProvider<ShiftsNotifier, List<Shift>>((ref) {
  return ShiftsNotifier();
});

class ShiftsNotifier extends StateNotifier<List<Shift>> {
  ShiftsNotifier() : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    const uuid = Uuid();
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    state = [
      Shift(
        id: uuid.v4(),
        userId: 'U1',
        userName: 'John Doe',
        startTime: startOfWeek.add(const Duration(hours: 8)),
        endTime: startOfWeek.add(const Duration(hours: 16)),
        role: 'Supervisor',
      ),
      Shift(
        id: uuid.v4(),
        userId: 'U2',
        userName: 'Maria Garcia',
        startTime: startOfWeek.add(const Duration(hours: 8)),
        endTime: startOfWeek.add(const Duration(hours: 16)),
        role: 'Washer',
      ),
      Shift(
        id: uuid.v4(),
        userId: 'U3',
        userName: 'Kostas P.',
        startTime: startOfWeek.add(const Duration(days: 1, hours: 14)),
        endTime: startOfWeek.add(const Duration(days: 1, hours: 22)),
        role: 'Coordinator',
      ),
    ];
  }

  void addShift(Shift shift) {
    state = [...state, shift];
  }

  void deleteShift(String id) {
    state = state.where((s) => s.id != id).toList();
  }
}
