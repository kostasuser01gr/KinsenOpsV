import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kinsen_ops/core/widgets/error_boundary.dart';
import 'package:kinsen_ops/features/shell/presentation/shell_screen.dart';
import 'package:kinsen_ops/features/fleet/presentation/fleet_screen.dart';
import 'package:kinsen_ops/features/washers/presentation/washers_screen.dart';
import 'package:kinsen_ops/features/washers/presentation/washers_kiosk_screen.dart';
import 'package:kinsen_ops/features/shifts/presentation/shifts_screen.dart';
import 'package:kinsen_ops/features/chat/presentation/chat_screen.dart';
import 'package:kinsen_ops/features/intelligence/presentation/intelligence_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/fleet',
    routes: [
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
                builder: (context, state) => const ErrorBoundary(
                  moduleName: 'Intelligence',
                  child: IntelligenceScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
