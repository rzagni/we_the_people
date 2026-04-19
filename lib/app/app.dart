import 'package:flutter/material.dart';

import 'package:we_the_people/app/router.dart';

class WeThePeopleApp extends StatelessWidget {
  const WeThePeopleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'We the People',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
