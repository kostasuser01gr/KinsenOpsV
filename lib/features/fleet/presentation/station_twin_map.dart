import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/fleet/domain/models/vehicle.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StationTwinMap extends ConsumerWidget {
  const StationTwinMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(fleetProvider);
    
    // Split vehicles into mock spatial zones
    final returnedZone = vehicles.where((v) => v.status == VehicleStatus.returned).toList();
    final cleaningZone = vehicles.where((v) => v.status == VehicleStatus.cleaning).toList();
    final readyZone = vehicles.where((v) => v.status == VehicleStatus.ready).toList();
    final maintenanceZone = vehicles.where((v) => v.status == VehicleStatus.maintenance || v.status == VehicleStatus.blocked).toList();

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.divider),
        image: DecorationImage(
          image: const NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'), // Cyber grid feel
          repeat: ImageRepeat.repeat,
          colorFilter: ColorFilter.mode(AppTheme.primary.withOpacity(0.05), BlendMode.srcATop),
        ),
      ),
      child: Stack(
        children: [
          // Background layout lines
          Positioned.fill(
            child: CustomPaint(painter: _StationLayoutPainter()),
          ),
          
          // Zone: Return Lane
          Positioned(
            left: 20, top: 40, bottom: 40, width: 120,
            child: _buildZone('RETURN LANE', AppTheme.warning, returnedZone),
          ),
          
          // Zone: Wash Bay
          Positioned(
            left: 180, top: 40, bottom: 40, width: 120,
            child: _buildZone('WASH BAY', AppTheme.primary, cleaningZone),
          ),
          
          // Zone: Ready Parking
          Positioned(
            left: 340, top: 40, bottom: 200, right: 20,
            child: _buildZone('READY FLEET PARKING', AppTheme.success, readyZone, isHorizontal: true),
          ),
          
          // Zone: Maintenance
          Positioned(
            left: 340, bottom: 40, height: 120, right: 20,
            child: _buildZone('MAINTENANCE GARAGE', AppTheme.error, maintenanceZone, isHorizontal: true),
          ),
        ],
      ),
    );
  }

  Widget _buildZone(String title, Color color, List<Vehicle> vehicles, {bool isHorizontal = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceGlass,
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 8),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              direction: isHorizontal ? Axis.horizontal : Axis.vertical,
              children: vehicles.map((v) => _MapVehicleNode(vehicle: v, color: color)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapVehicleNode extends StatelessWidget {
  final Vehicle vehicle;
  final Color color;

  const _MapVehicleNode({required this.vehicle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${vehicle.plate} - ${vehicle.model}',
      child: Container(
        width: 40,
        height: 80,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 10)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.car, color: color, size: 20),
            const SizedBox(height: 4),
            Text(vehicle.plate.substring(0, 3), style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _StationLayoutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.divider
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw some stylized road lines
    final dashPaint = Paint()
      ..color = AppTheme.textSecondary.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Just some abstract tech lines for the floor
    canvas.drawLine(const Offset(160, 0), Offset(160, size.height), paint);
    canvas.drawLine(const Offset(320, 0), Offset(320, size.height), paint);
    canvas.drawLine(const Offset(320, 160), Offset(size.width, 160), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
