import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:kinsen_ops/core/config/api_config.dart';

final fleetProvider = StateNotifierProvider<FleetNotifier, List<Vehicle>>((ref) {
  return FleetNotifier();
});

class FleetNotifier extends StateNotifier<List<Vehicle>> {
  FleetNotifier() : super([]) {
    _fetchFleet();
  }

  Future<void> _fetchFleet() async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/fleet'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        state = data.map((json) {
           return Vehicle(
            id: json['id'],
            plate: json['plate'],
            model: json['model'],
            status: _parseStatus(json['status']),
            fuelLevel: json['fuelLevel']?.toDouble() ?? 1.0,
            mileage: json['mileage'] ?? 0,
            lastStatusUpdate: DateTime.now(), // Fallback if API lacks it
            assignedWasherId: json['assignedWasherId'],
          );
        }).toList();
      } else {
        print('Failed to load fleet: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching fleet: $e');
    }
  }
  
  VehicleStatus _parseStatus(String? status) {
     switch (status) {
       case 'returned': return VehicleStatus.returned;
       case 'cleaning': return VehicleStatus.cleaning;
       case 'qc': return VehicleStatus.qc;
       case 'ready': return VehicleStatus.ready;
       case 'blocked': return VehicleStatus.blocked;
       case 'maintenance': return VehicleStatus.maintenance;
       case 'rented': return VehicleStatus.rented;
       default: return VehicleStatus.ready;
     }
  }

  Future<void> updateVehicleStatus(String id, VehicleStatus newStatus) async {
    try {
      final statusString = newStatus.toString().split('.').last;
      final response = await http.put(
        Uri.parse('${ApiConfig.baseUrl}/fleet/$id/status'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'status': statusString}),
      );

      if (response.statusCode == 200) {
        state = [
          for (final v in state)
            if (v.id == id) v.copyWith(status: newStatus, lastStatusUpdate: DateTime.now()) else v,
        ];
      }
    } catch (e) {
      print('Error updating status: $e');
    }
  }
}
