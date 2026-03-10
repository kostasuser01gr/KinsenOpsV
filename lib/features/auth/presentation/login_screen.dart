import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/auth/auth_provider.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppTheme.divider),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LucideIcons.command, color: AppTheme.primary, size: 64),
              const SizedBox(height: 24),
              Text(
                'Kinsen Ops',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Select your role to enter the platform', style: TextStyle(color: AppTheme.textSecondary)),
              const SizedBox(height: 40),
              ...UserRole.values.map((role) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(authProvider.notifier).login('Staff Member', role);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.background,
                        foregroundColor: AppTheme.textPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: AppTheme.divider),
                        ),
                      ),
                      child: Text(role.name.toUpperCase()),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
