import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/providers/app_state.dart';
import 'package:vitapmate/providers/client.dart';
import 'package:vitapmate/router/route_names.dart';

class TopAppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  TopAppBar({super.key}) : preferredSize = Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String text = '';
    var k = ref.watch(clientProvider);
    var app = ref.watch(appStateProvider);
    if (k.isLoading) {
      text = " Updating data";
    } else {
      if (!app.networkUp) {
        text = " No internet";
      } else if (app.isLogin && app.networkUp && !app.vtopDown) {
        text = "";
      }
    }
    return AppBar(
      // expandedHeight: 10,
      // floating: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Vitap Mate',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
          ),
          Text(text, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
        ],
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
