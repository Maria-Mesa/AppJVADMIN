import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jvadmin/src/features/navigation_bar/domain/entity/destination_route.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({required this.destinations, super.key});
  final List<DestinationRoute> destinations;

  @override
  State<CustomNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<CustomNavigationBar> {
  int _getPage({required String location}) {
    final DestinationRoute? matchingRoute =
        widget.destinations.firstWhereOrNull(
          (DestinationRoute dest) => location == dest.path,
        ) ??
        widget.destinations.firstWhereOrNull(
          (DestinationRoute dest) => location.startsWith(dest.path),
        );
    return matchingRoute?.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return GoRouterBuilder(
      builder: (BuildContext context, GoRouterState state) {
        final String currentLocation = state.uri.path;
        final int currentPage = _getPage(location: currentLocation);
        return NavigationBar(
          selectedIndex: currentPage,
          onDestinationSelected: (int value) {
            if (value == currentPage) {
              return;
            }

            final String targetPath = widget.destinations[value].path;
            final String initialPath = widget.destinations.first.path;
            if (value == 0 && currentLocation != initialPath) {
              context.pop();
            } else if (currentLocation == initialPath) {
              context.push(targetPath);
            } else {
              context.pushReplacement(targetPath);
            }
          },
          destinations: widget.destinations
              .map((DestinationRoute route) => route.destination)
              .toList(),
        );
      },
    );
  }
}

// Implementación de GoRouterBuilder para eventos de navegación
class GoRouterBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, GoRouterState state) builder;

  const GoRouterBuilder({required this.builder, super.key});

  @override
  State<GoRouterBuilder> createState() => _GoRouterBuilderState();
}

class _GoRouterBuilderState extends State<GoRouterBuilder>
    with WidgetsBindingObserver {
  late final GoRouter _router;
  late GoRouterState _state;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _router = GoRouter.of(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _state = _router.state;
    _router.routerDelegate.addListener(_handleRouteChange);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Actualiza cuando la app vuelve al primer plano
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _state = GoRouter.of(context).state;
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  void _handleRouteChange() {
    final GoRouterState currentState = _router.state;
    if (_state.uri.path != currentState.uri.path) {
      setState(() {
        _state = currentState;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _router.routerDelegate.removeListener(_handleRouteChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el estado actual en cada build para capturar cambios inmediatos
    final GoRouterState currentState = GoRouter.of(context).state;
    return widget.builder(context, currentState);
  }
}
