import 'package:flutter/material.dart';
import 'package:movie_db/resources/assets_values.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AssetsValues.appIcon));
  }
}
