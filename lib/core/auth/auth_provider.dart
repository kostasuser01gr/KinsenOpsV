import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  UserProfile({required this.id, required this.name, required this.role});
}

final authProvider = StateNotifierProvider<AuthNotifier, UserProfile?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<UserProfile?> {
  AuthNotifier() : super(null);

  void login(String name, UserRole role) {
    state = UserProfile(id: 'u1', name: name, role: role);
  }

  void logout() {
    state = null;
  }
}
