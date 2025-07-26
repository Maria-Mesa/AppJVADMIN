import 'package:flutter/material.dart';
import 'package:jvadmin/src/core/constants/constants.dart';

class Destination extends StatelessWidget {
  const Destination({
    required IconData icon,
    required String label,
    IconData? activeIcon,
    bool showBadge = false,
    super.key,
  }) : _icon = icon,
       _activeIcon = activeIcon,
       _label = label,
       _showBadge = showBadge;

  final IconData _icon;
  final IconData? _activeIcon;
  final String _label;
  final bool _showBadge;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      tooltip: _label,
      selectedIcon: _iconNavigation(
        icon: _activeIcon ?? _icon,
        color: Constants.primaryColor,
      ),
      icon: _iconNavigation(
        icon: _icon,
        color: Theme.of(context).iconTheme.color!,
      ),

      label: _label,
    );
  }

  Widget _iconNavigation({Color? color, IconData? icon}) {
    return Badge.count(
      count: 1,
      isLabelVisible: _showBadge,
      offset: const Offset(5, -5),
      child: Icon(icon, color: color),
    );
  }
}
