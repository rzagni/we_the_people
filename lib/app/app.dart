import 'package:flutter/material.dart';
import 'package:we_the_people/app/router.dart';
import 'package:we_the_people/app/theme/app_theme.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class WeThePeopleApp extends StatelessWidget {
  const WeThePeopleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'We the People',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
    );
  }
}
