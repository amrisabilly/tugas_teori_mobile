import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/landing/landing_screen.dart';
import 'package:flutter_application_3/features/presentation/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    // GoRoute(path: '/beranda', builder: (context, state) => const BerandaPage()),
  ],
);
