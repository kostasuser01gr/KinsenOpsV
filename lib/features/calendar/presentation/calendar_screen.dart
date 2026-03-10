import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.divider),
                ),
                child: _buildTimeline(context),
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
          'Operational Timeline',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Unified view of shifts, fleet load, and washer throughput',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final hours = List.generate(24, (i) => i);
    final now = DateTime.now();

    return ListView.builder(
      itemCount: 24,
      itemBuilder: (context, hour) {
        final isCurrentHour = now.hour == hour;
        return Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppTheme.divider)),
            color: isCurrentHour ? AppTheme.primary.withOpacity(0.05) : null,
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: Text(
                  '${hour.toString().padLeft(2, '0')}:00',
                  style: TextStyle(
                    color: isCurrentHour ? AppTheme.primary : AppTheme.textSecondary,
                    fontWeight: isCurrentHour ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: Stack(
                  children: [
                    if (hour == 9 || hour == 14)
                      _buildTimelineEvent('Shift Change', Colors.blue, 10, '3 Supervisors, 5 Washers'),
                    if (hour == 11)
                      _buildTimelineEvent('Fleet Peak', Colors.orange, 120, '12 Returns Expected'),
                    if (hour == 15)
                      _buildTimelineEvent('Maintenance Window', Colors.red, 60, 'BMW 3 Series Service'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimelineEvent(String title, Color color, double left, String subtitle) {
    return Positioned(
      left: left,
      top: 10,
      bottom: 10,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
            Text(subtitle, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
          ],
        ),
      ),
    );
  }
}
