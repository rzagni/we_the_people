import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:we_the_people_mobile/auth/login_screen.dart';
import 'package:we_the_people_mobile/auth/signup_screen.dart';
import 'package:we_the_people_mobile/home/home_screen.dart';
import 'package:we_the_people_mobile/onboarding/onboarding_screen.dart';
import 'package:we_the_people_mobile/splash/splash_screen.dart';
import 'package:we_the_people_mobile/surveys/survey_detail_screen.dart';
import 'package:we_the_people_mobile/surveys/survey_screen.dart';

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
    GoRoute(
      path: '/survey/:surveyId',
      builder: (context, state) {
        final surveyId = state.pathParameters['surveyId']!;
        final deliveryId = state.uri.queryParameters['deliveryId'];

        return SurveyScreen(surveyId: surveyId, deliveryId: deliveryId);
      },
    ),
    GoRoute(
      path: '/survey/:surveyId',
      builder: (context, state) {
        final surveyId = state.pathParameters['surveyId']!;
        final deliveryId = state.uri.queryParameters['deliveryId'];

        return SurveyDetailScreen(surveyId: surveyId, deliveryId: deliveryId);
      },
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Route not found: ${state.uri}')));
  },
);
