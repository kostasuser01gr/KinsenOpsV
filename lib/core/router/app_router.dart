import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kinsen_ops/core/auth/auth_provider.dart';
import 'package:kinsen_ops/core/widgets/error_boundary.dart';
import 'package:kinsen_ops/features/shell/presentation/shell_screen.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_screen.dart';
import 'package:kinsen_ops/features/washers/presentation/washers_screen.dart';
import 'package:kinsen_ops/features/washers/presentation/washers_kiosk_screen.dart';
import 'package:kinsen_ops/features/shifts/presentation/shifts_screen.dart';
import 'package:kinsen_ops/features/chat/presentation/chat_screen.dart';
import 'package:kinsen_ops/features/intelligence/presentation/intelligence_screen.dart';
import 'package:kinsen_ops/features/calendar/presentation/calendar_screen.dart';
import 'package:kinsen_ops/features/auth/presentation/login_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/fleet',
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == '/login';
      final isKiosk = state.matchedLocation == '/kiosk';
      
      if (isKiosk) return null;

      if (authState == null && !loggingIn) return '/login';
      if (authState != null && loggingIn) return '/fleet';
      
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/kiosk',
        builder: (context, state) => const ErrorBoundary(
          moduleName: 'Wash Kiosk',
          child: WashersKioskScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/fleet',
                builder: (context, state) => const ErrorBoundary(
                  moduleName: 'Fleet',
                  child: FleetScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/washers',
                builder: (context, state) => const ErrorBoundary(
                  moduleName: 'Washers',
                  child: WashersScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/shifts',
                builder: (context, state) => const ErrorBoundary(
                  moduleName: 'Shifts',
                  child: ShiftsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/calendar',
                builder: (context, state) => const ErrorBoundary(
                  moduleName: 'Calendar',
                  child: CalendarScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/chat',
                builder: (context, state) => const ErrorBoundary(
                  moduleName: 'Chat',
                  child: ChatScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/intelligence',
                builder: (context, state) {
                  if (authState?.role != UserRole.coordinator) {
                    return const Scaffold(body: Center(child: Text('Access Denied: Coordinator role required.')));
                  }
                  return const ErrorBoundary(
                    moduleName: 'Intelligence',
                    child: IntelligenceScreen(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
