import 'package:flutter/material.dart';
import 'package:we_the_people_admin/app/router.dart';
import 'package:we_the_people_admin/app/theme/app_theme.dart';

class WeThePeopleAdminApp extends StatelessWidget {
  const WeThePeopleAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'We the People Admin',
      theme: AppTheme.light,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
