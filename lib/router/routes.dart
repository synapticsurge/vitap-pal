import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/providers/settings.dart' as psettings;
import 'package:vitapmate/screens/pages/others/others.dart';
import 'package:vitapmate/screens/pages/settings/about.dart';
import 'package:vitapmate/screens/pages/attendance.dart';
import 'package:vitapmate/screens/pages/settings/creds.dart';
import 'package:vitapmate/screens/pages/settings/features_status.dart';
import 'package:vitapmate/screens/scaffold.dart';
import 'package:vitapmate/screens/pages/settings/settings.dart';
import 'package:vitapmate/screens/pages/social/social.dart';
import 'package:vitapmate/screens/pages/timetable.dart';
import 'package:vitapmate/providers/user.dart';
import 'package:vitapmate/router/route_names.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterprovider = Provider((ref) {
  return GoRouter(
    redirect: (context, state) => redirect(context, ref, state),
    initialLocation: '/timetable',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(child: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/timetable',
                name: RouteNames.timetablePageRoutename,
                builder: (context, state) => Timetable(),
                routes: [
                  GoRoute(
                    path: 'details',
                    builder: (context, state) => Timetable(),
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/attendance',
                name: RouteNames.attendanceRoutename,
                builder: (context, state) => Attendance(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/others',
                name: RouteNames.vtoputilsRoutename,
                builder: (context, state) => Others(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/social',
                name: RouteNames.socialRouteName,
                builder: (context, state) => Social(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: '/settings',
        name: RouteNames.settingsRoutename,
        builder: (context, state) => Settings(),
        routes: [
          GoRoute(
            path: 'about',
            name: RouteNames.aboutusRoutename,
            builder: (context, state) => About(),
          ),
          GoRoute(
            path: 'features_status',
            name: RouteNames.featuresRouteName,
            builder: (context, state) => FeaturesStatus(),
          ),
          GoRoute(
            path: 'creds',
            name: RouteNames.credsRouteName,
            builder: (context, state) => Creds(),
          ),
        ],
      ),
    ],
  );
});

FutureOr<String?> redirect(
  BuildContext context,
  Ref ref,
  GoRouterState state,
) async {
  var user = await ref.read(userProvider.future);
  var settings = await ref.read(psettings.settingsProvider.future);
  if (!user.isValid || settings.selSemId == null) {
    return "/settings/creds";
  } else if (user.initialLoad) {
    return "/settings/creds";
  } else {
    return null;
  }
}
