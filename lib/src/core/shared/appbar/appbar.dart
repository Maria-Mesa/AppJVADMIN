import 'package:flutter/material.dart';
import 'package:jvadmin/src/core/constants/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFDC1F26),
      title: Row(
        spacing: Constants.defaultPadding,
        children: <Widget>[
          DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: SizedBox.square(
              dimension: 40,
              child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            ),
          ),

          const Text('JV ADMIN', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('MF', style: TextStyle(color: Color(0xFFDC1F26))),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
