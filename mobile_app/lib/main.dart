import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/helpers/providers/profile_provider.dart';
import 'package:mobile_app/helpers/providers/request_provider.dart';
import 'package:mobile_app/screens/auth/login.screen.dart';
import 'package:mobile_app/screens/create_family.screen.dart';

import 'package:mobile_app/screens/dashboard.screen.dart';
import 'package:mobile_app/screens/join_family.screen.dart';
import 'package:mobile_app/screens/main_view.screen.dart';

import 'package:mobile_app/screens/profile.screen.dart';
import 'package:mobile_app/screens/settings.screen.dart';
import 'package:mobile_app/screens/welcome.screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => ProfileProvider(
            id: '',
            email: '',
            firstName: '',
            lastName: '',
          ),
        ),
        ListenableProvider(
          create: (context) => RequestProvider(
            requests: [],
          ),
        ),
      ],
      child: MaterialApp(
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)
        // ),
        // theme: ThemeData(
        //  textTheme: GoogleFonts.zenDotsTextTheme(
        //    Theme.of(context).textTheme,
        //  ),
        routes: {
          '/login':(context) =>const LoginScreen(),
          '/dashboard': (context) => const MainView(),
          '/create-family': (context) => const CreateFamily(),

          '/join-family': (context) => const JoinFamilyScreen(),

         
        },
        // home: const WelcomeScreen(),
        home: const DashboardScreen(),
      ),
    );
  }
}
