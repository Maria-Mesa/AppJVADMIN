import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:jvadmin/src/core/shared/appbar/appbar.dart';
import 'package:jvadmin/src/features/navigation_bar/domain/entity/destination_route.dart';
import 'package:jvadmin/src/features/navigation_bar/presententation/page/navigation_bar.dart';
import 'package:jvadmin/src/features/navigation_bar/presententation/widget/destination.dart';

class Shell extends StatefulWidget {
  const Shell({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: widget.navigationShell,
      bottomNavigationBar: const CustomNavigationBar(
        destinations: <DestinationRoute>[
          DestinationRoute(
            page: 0,
            path: '/home',
            destination: Destination(
              icon: HugeIcons.strokeRoundedHome01,
              label: 'Inicio',
            ),
          ),
          DestinationRoute(
            page: 1,
            path: '/inventory',
            destination: Destination(
              icon: HugeIcons.strokeRoundedListView,
              label: 'Inventario',
            ),
          ),
          DestinationRoute(
            page: 2,
            path: '/sales',
            destination: Destination(
              icon: HugeIcons.strokeRoundedShoppingCart02,
              label: 'Ventas',
            ),
          ),
          DestinationRoute(
            page: 3,
            path: '/providers',
            destination: Destination(
              icon: Icons.local_shipping,
              label: 'Proveedores',
            ),
          ),
          DestinationRoute(
            page: 4,
            path: '/accounting',
            destination: Destination(
              icon: HugeIcons.strokeRoundedWallet01,
              label: 'Contabilidad',
            ),
          ),
        ],
      ),
    );
  }
}
