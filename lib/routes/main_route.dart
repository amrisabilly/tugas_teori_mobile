import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/presentation/fitur/cekHari.dart';
import 'package:flutter_application_3/features/presentation/fitur/konversi-waktu.dart';
import 'package:flutter_application_3/features/presentation/home/home_screen.dart';
import 'package:flutter_application_3/features/presentation/profil/profil_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_3/features/presentation/fitur/piramida.dart';

final GoRouter router = GoRouter(
  initialLocation: '/', 
  routes: [
    // Home Route
    GoRoute(path: '/', redirect: (context, state) => '/home'),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),

    // Feature Routes
    GoRoute(path: '/piramida', builder: (context, state) => const Piramida()),
    GoRoute(
      path: '/konversiWaktu',
      builder: (context, state) => const KonversiWaktu(),
    ),
    GoRoute(
      path: '/konversiHari',
      builder: (context, state) => const CekHari(),
    ),

    // Profile Route
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
  ],
);
