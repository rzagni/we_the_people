import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_the_people/features/auth/login_screen.dart';
import 'package:we_the_people/features/auth/signup_screen.dart';
import 'package:we_the_people/features/home/home_screen.dart';
import 'package:we_the_people/features/onboarding/onboarding_screen.dart';
import 'package:we_the_people/features/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Route not found: ${state.uri}')));
  },
);
