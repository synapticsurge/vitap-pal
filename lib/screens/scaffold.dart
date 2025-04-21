import 'package:flutter/material.dart';
import 'package:vitapmate/screens/component/appbar.dart';
import 'package:vitapmate/screens/component/navbar.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [TopAppBar(), SliverToBoxAdapter(child: child)],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
