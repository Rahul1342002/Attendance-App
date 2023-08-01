import 'package:attendance/pages/home/home.dart';
import 'package:attendance/pages/list/classlist.dart';
import 'package:attendance/pages/sections/sections.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter Routes = GoRouter(
  initialLocation: "/sections",
  routes: [
    GoRoute(
      path: "/home",
      builder: (BuildContext context, GoRouterState state) {
        return Home(
          sectionName: state.queryParameters["section"]!,
        );
      },
    ),
    GoRoute(
      path: "/sections",
      builder: (BuildContext context, GoRouterState state) {
        return const Section();
      },
    ),
    GoRoute(
      path: "/classlist",
      builder: (BuildContext context, GoRouterState state) {
        return const ClassList();
      },
    ),
  ],
);
