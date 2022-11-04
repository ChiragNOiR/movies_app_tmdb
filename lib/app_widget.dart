import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tmdb_riverpod/data/styles/app_style.dart';
import 'package:movie_tmdb_riverpod/ui/screens/splash_screen/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color allColor = AppStyle.primaryColor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Application',
      theme: ThemeData(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          scaffoldBackgroundColor: allColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF242A32),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              toolbarTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ))),
      home: const SplashScreen(),
    );
  }
}
