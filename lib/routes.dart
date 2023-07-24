import 'package:attendance/main.dart';
import 'package:attendance/pages/home/home.dart';
import 'package:attendance/pages/list/classlist.dart';
import 'package:attendance/pages/list/components/classtab.dart';
import 'package:attendance/pages/sections/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:go_router/go_router.dart';

final GoRouter Routes = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) {
          return const ClassList();
        }),
  ],
);
