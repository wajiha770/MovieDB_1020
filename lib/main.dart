import 'package:flutter/material.dart';
import 'package:movie_db/provider/main_navigation_provider.dart';
import 'package:provider/provider.dart';

import 'movie_db_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => MainNavigationProvider()),
      ],
      child: const MovieDbApp(),
    ),
  );
}
