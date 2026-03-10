import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/shell/presentation/ops_inbox_overlay.dart';
import 'package:kinsen_ops/features/chat/presentation/chat_controller.dart';

class ShellScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ShellScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  ConsumerState<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends ConsumerState<ShellScreen> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _onTap(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void _toggleOpsInbox() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 400,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(-360, 50),
          child: Material(
            color: Colors.transparent,
            child: TapRegion(
              onTapOutside: (event) => _toggleOpsInbox(),
              child: const OpsInboxOverlay(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width < 1024;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop || isTablet)
            _buildSidebar(context, isDesktop),
          Expanded(
            child: Column(
              children: [
                _buildTopBar(context),
                Expanded(child: widget.navigationShell),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: (isDesktop || isTablet)
          ? null
          : BottomNavigationBar(
              currentIndex: widget.navigationShell.currentIndex,
              onTap: _onTap,
              items: const [
                BottomNavigationBarItem(icon: Icon(LucideIcons.car), label: 'Fleet'),
                BottomNavigationBarItem(icon: Icon(LucideIcons.droplets), label: 'Washers'),
                BottomNavigationBarItem(icon: Icon(LucideIcons.calendarDays), label: 'Shifts'),
                BottomNavigationBarItem(icon: Icon(LucideIcons.messageSquare), label: 'Chat'),
                BottomNavigationBarItem(icon: Icon(LucideIcons.sparkles), label: 'AI'),
              ],
            ),
    );
  }

  Widget _buildSidebar(BuildContext context, bool isDesktop) {
    return Container(
      width: isDesktop ? 260 : 80,
      color: AppTheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                const Icon(LucideIcons.command, color: AppTheme.primary, size: 32),
                if (isDesktop) ...[
                  const SizedBox(width: 12),
                  Text(
                    'Kinsen Ops',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 32),
          _SidebarItem(
            icon: LucideIcons.car,
            label: 'Fleet',
            isSelected: widget.navigationShell.currentIndex == 0,
            isDesktop: isDesktop,
            onTap: () => _onTap(0),
          ),
          _SidebarItem(
            icon: LucideIcons.droplets,
            label: 'Washers',
            isSelected: widget.navigationShell.currentIndex == 1,
            isDesktop: isDesktop,
            onTap: () => _onTap(1),
          ),
          _SidebarItem(
            icon: LucideIcons.calendarDays,
            label: 'Shifts',
            isSelected: widget.navigationShell.currentIndex == 2,
            isDesktop: isDesktop,
            onTap: () => _onTap(2),
          ),
          _SidebarItem(
            icon: LucideIcons.messageSquare,
            label: 'Chat',
            isSelected: widget.navigationShell.currentIndex == 3,
            isDesktop: isDesktop,
            onTap: () => _onTap(3),
          ),
          _SidebarItem(
            icon: LucideIcons.sparkles,
            label: 'Intelligence',
            isSelected: widget.navigationShell.currentIndex == 4,
            isDesktop: isDesktop,
            onTap: () => _onTap(4),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.circle, color: Colors.green, size: 12),
                  if (isDesktop) ...[
                    const SizedBox(width: 8),
                    const Text('All Systems Green', style: TextStyle(color: Colors.green, fontSize: 12)),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    final unreadNotifications = ref.watch(opsInboxProvider).length;

    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppTheme.surfaceGlass,
        border: Border(bottom: BorderSide(color: AppTheme.divider)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.divider),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search or ask...',
                  prefixIcon: Icon(LucideIcons.search, size: 20, color: AppTheme.textSecondary),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          CompositedTransformTarget(
            link: _layerLink,
            child: IconButton(
              icon: Stack(
                children: [
                  const Icon(LucideIcons.bell),
                  if (unreadNotifications > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        constraints: const BoxConstraints(minWidth: 12, minHeight: 12),
                        child: Text(unreadNotifications.toString(), style: const TextStyle(color: Colors.white, fontSize: 8)),
                      ),
                    ),
                ],
              ),
              onPressed: _toggleOpsInbox,
            ),
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            backgroundColor: AppTheme.primary,
            child: Text('U'),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isDesktop;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isDesktop,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppTheme.primary : AppTheme.textSecondary;
    final bgColor = isSelected ? AppTheme.primary.withOpacity(0.1) : Colors.transparent;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            if (isDesktop) ...[
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
