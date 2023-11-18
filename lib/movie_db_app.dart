import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db/ui/bottom_nav_page.dart';

class MovieDbApp extends StatefulWidget {
  const MovieDbApp({Key? key}) : super(key: key);

  @override
  State<MovieDbApp> createState() => _MovieDbAppState();
}

class _MovieDbAppState extends State<MovieDbApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB',
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => "TMDB",
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E2739),
          foregroundColor: Color(0xFF2E2739),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        primaryColor: const Color(0xFF2E2739),
        primaryColorLight: const Color(0xFF564CA3),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        iconTheme: const IconThemeData(color: Colors.white),
        primaryIconTheme: const IconThemeData(color: Color(0xFF827D88)),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      home: const BottomNavPage(),
    );
  }
}
