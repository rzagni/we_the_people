import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_the_people_admin/features/admin/admin_survey_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/admin/surveys',
  routes: [
    GoRoute(
      path: '/admin/surveys',
      builder: (context, state) => const AdminSurveyScreen(),
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Route not found: ${state.uri}')));
  },
);
