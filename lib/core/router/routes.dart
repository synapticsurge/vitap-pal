import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vitapmate/core/router/route_names.dart';
import 'package:vitapmate/core/widgets/scaffold.dart';
import 'package:vitapmate/features/attendance/presentation/pages/attendance_page.dart';
import 'package:vitapmate/features/timetable/presentation/pages/timetable_page.dart';

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
                builder: (context, state) => TimetablePage(),
                routes: [
                  GoRoute(
                    path: 'details',
                    builder: (context, state) => Placeholder(),
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
                builder: (context, state) => AttendancePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/others',
                name: RouteNames.vtoputilsRoutename,
                builder: (context, state) => Placeholder(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/social',
                name: RouteNames.socialRouteName,
                builder: (context, state) => Placeholder(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: '/settings',
        name: RouteNames.settingsRoutename,
        builder: (context, state) => Placeholder(),
        routes: [
          GoRoute(
            path: 'about',
            name: RouteNames.aboutusRoutename,
            builder: (context, state) => Placeholder(),
          ),
          GoRoute(
            path: 'features_status',
            name: RouteNames.featuresRouteName,
            builder: (context, state) => Placeholder(),
          ),
          GoRoute(
            path: 'credentials',
            name: RouteNames.credsRouteName,
            builder: (context, state) => Placeholder(),
          ),
        ],
      ),
      GoRoute(
        path: '/VtopWeb',
        name: RouteNames.vtopWebsiteRouteName,
        builder: (context, state) => Placeholder(),
      ),
    ],
  );
});

FutureOr<String?> redirect(
  BuildContext context,
  Ref ref,
  GoRouterState state,
) async {
  // var user = await ref.read(userProvider.future);
  // var settings = await ref.read(psettings.settingsProvider.future);
  // if (!user.isValid || settings.selSemId == null) {
  //   return "/settings/creds";
  // } else if (user.initialLoad) {
  //   return "/settings/creds";
  // }
  return null;
}
