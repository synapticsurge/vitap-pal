import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/core/router/route_names.dart';

class OthersPage extends StatelessWidget {
  const OthersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () => context.pushNamed(RouteNames.vtopWebsiteRouteName),
          child: Text("Open Vtop Website"),
        ),
      ],
    );
  }
}
