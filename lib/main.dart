import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/views/agents_page.dart';
import 'package:valorant_app/views/home_page.dart';
import 'package:valorant_app/views/login_page.dart';
import 'package:valorant_app/views/profile_page.dart';
import 'package:valorant_app/views/register_page.dart';
import 'package:valorant_app/views/bundles_page.dart';
import 'package:valorant_app/views/testimonies_page.dart';
import 'package:valorant_app/views/time_conversion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        RegisterPage.routeName: (_) => const RegisterPage(),
        HomePage.routeName: (_) => const HomePage(),
        AgentsPage.routeName: (_) => const AgentsPage(),
        BundlesPage.routeName: (_) => const BundlesPage(),
        TimeConversion.routeName: (_) => const TimeConversion(),
        TestimoniesPage.routeName: (_) => const TestimoniesPage(),
        ProfilePage.routeName: (_) => const ProfilePage(),
      },
    );
  }
}