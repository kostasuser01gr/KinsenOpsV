import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/auth/auth_provider.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final success = await ref.read(authProvider.notifier).login(
      _usernameController.text,
      _passwordController.text,
    );

    if (!success && mounted) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Invalid credentials';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const Text('Sign in to access the platform', style: TextStyle(color: AppTheme.textSecondary)),
              const SizedBox(height: 32),
              
              if (_errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.withOpacity(0.5)),
                  ),
                  child: Row(
                    children: [
                      const Icon(LucideIcons.alertCircle, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
                    ],
                  ),
                ),

              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username or ID',
                  prefixIcon: const Icon(LucideIcons.user),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: AppTheme.background,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(LucideIcons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: AppTheme.background,
                ),
                onSubmitted: (_) => _handleLogin(),
              ),
              const SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: _isLoading 
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Text('SIGN IN', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                ),
              ),
              
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              const Text('Demo Credentials:', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
              const Text('u_admin / password123 (Coordinator)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
              const Text('u_washer / password123 (Washer)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
