import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitapmate/router/route_names.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 10,
      floating: true,
      title: Text(
        "Vitap Mate",
        style: GoogleFonts.bungeeSpice(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(RouteNames.settingsRoutename);
          },
          icon: Icon(
            Icons.settings,
            color: Colors.white.withValues(alpha: 0.8),
            size: 28,
          ),
          tooltip: 'Settings',
        ),
      ],
    );
  }
}
