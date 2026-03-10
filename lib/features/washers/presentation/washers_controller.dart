import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_controller.dart';
import 'package:kinsen_ops/core/config/api_config.dart';

final washersProvider = StateNotifierProvider<WashersNotifier, List<WashTask>>((ref) {
  return WashersNotifier(ref);
});

class WashersNotifier extends StateNotifier<List<WashTask>> {
  final Ref _ref;
  WashersNotifier(this._ref) : super([]) {
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/washers/tasks'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        state = data.map((json) {
           return WashTask(
             id: json['id'],
             vehicleId: json['vehicleId'],
             washerId: json['washerId'],
             preset: _parsePreset(json['preset']),
             createdAt: DateTime.parse(json['createdAt']),
             startedAt: json['startedAt'] != null ? DateTime.parse(json['startedAt']) : null,
             finishedAt: json['finishedAt'] != null ? DateTime.parse(json['finishedAt']) : null,
             isQcPassed: json['isQcPassed'] ?? false,
             qcNotes: json['qcNotes'],
           );
        }).toList();
      }
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }

  WashPreset _parsePreset(String? preset) {
    switch(preset) {
      case 'basic': return WashPreset.basic;
      case 'full': return WashPreset.full;
      case 'express': return WashPreset.express;
      case 'vip': return WashPreset.vip;
      default: return WashPreset.basic;
    }
  }

  Future<void> createTask(String vehicleId, WashPreset preset) async {
    try {
      final presetString = preset.toString().split('.').last;
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/washers/tasks'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'vehicleId': vehicleId, 'preset': presetString}),
      );

      if (response.statusCode == 201) {
        final newTaskData = json.decode(response.body);
        final newTask = WashTask(
            id: newTaskData['id'],
            vehicleId: newTaskData['vehicleId'],
            washerId: newTaskData['washerId'],
            preset: _parsePreset(newTaskData['preset']),
            createdAt: DateTime.parse(newTaskData['createdAt']),
        );
        state = [...state, newTask];
        // Also refresh fleet to see status update
        _ref.read(fleetProvider.notifier).updateVehicleStatus(vehicleId, VehicleStatus.cleaning); // Optimistic UI update
      }
    } catch(e) {
      print('Error creating task: $e');
    }
  }

  Future<void> completeTask(String taskId, {bool qcPassed = true, String? notes}) async {
    try {
       final response = await http.put(
        Uri.parse('${ApiConfig.baseUrl}/washers/tasks/$taskId/complete'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'qcPassed': qcPassed, 'qcNotes': notes}),
      );

      if (response.statusCode == 200) {
        final updatedTaskData = json.decode(response.body);
        state = [
          for (final task in state)
            if (task.id == taskId)
              task.copyWith(
                finishedAt: DateTime.parse(updatedTaskData['finishedAt']),
                isQcPassed: updatedTaskData['isQcPassed'],
                qcNotes: updatedTaskData['qcNotes'],
              )
            else
              task,
        ];

        final task = state.firstWhere((t) => t.id == taskId);
        _ref.read(fleetProvider.notifier).updateVehicleStatus(task.vehicleId, qcPassed ? VehicleStatus.ready : VehicleStatus.qc);
      }
    } catch(e) {
      print('Error completing task: $e');
    }
  }
}
