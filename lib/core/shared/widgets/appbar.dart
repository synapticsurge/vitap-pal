import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/core/constants/constants.dart';
import 'package:vitapmate/core/router/route_names.dart';
import 'package:vitapmate/core/shared/providers/app_state.dart';
import 'package:vitapmate/core/shared/user/presentation/providers/user.dart';

class TopAppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  TopAppBar({super.key}) : preferredSize = Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      // expandedHeight: 10,
      // floating: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Vitap Mate',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
          ),
          Status(),
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

class Status extends ConsumerWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);
    return user.when(
      data: (data) {
        if (!data.isValid && data.username != null) {
          return InkWell(
            onTap: () {
              GoRouter.of(context).pushNamed(RouteNames.credsRouteName);
            },
            child: Text(
              "Please Update Your Password ǃ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.secondary,
              ),
            ),
          );
        } else {
          return const SubStatus();
        }
      },
      error: (error, stackTrace) {
        return const SubStatus();
      },
      loading: () {
        return const SubStatus();
      },
    );
  }
}

class SubStatus extends ConsumerWidget {
  const SubStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var app = ref.watch(appStateProvider);
    if (!app.newtork) {
      return Text(
        "No Internet Connection",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: AppColors.ptext,
        ),
      );
    }
    return SizedBox.shrink();
  }
}
