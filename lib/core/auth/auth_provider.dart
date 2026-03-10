import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kinsen_ops/core/config/api_config.dart';

enum UserRole {
  coordinator,
  supervisor,
  employee,
  washer,
  fleetAgent,
}

class UserProfile {
  final String id;
  final String name;
  final UserRole role;
  final String token;

  UserProfile({required this.id, required this.name, required this.role, required this.token});
}

final authProvider = StateNotifierProvider<AuthNotifier, UserProfile?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<UserProfile?> {
  AuthNotifier() : super(null);

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final user = data['user'];
        
        UserRole role;
        switch(user['role']) {
          case 'coordinator': role = UserRole.coordinator; break;
          case 'supervisor': role = UserRole.supervisor; break;
          case 'washer': role = UserRole.washer; break;
          case 'fleet_agent': role = UserRole.fleetAgent; break;
          default: role = UserRole.employee;
        }

        state = UserProfile(
          id: user['id'],
          name: user['name'],
          role: role,
          token: data['token'],
        );
        return true;
      }
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  void logout() {
    state = null;
  }
}
