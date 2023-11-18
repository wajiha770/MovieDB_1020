import 'package:flutter/material.dart';
import 'package:movie_db/provider/main_navigation_provider.dart';
import 'package:movie_db/ui/dashboard_page.dart';
import 'package:movie_db/ui/media_library_page.dart';
import 'package:movie_db/ui/more_page.dart';
import 'package:movie_db/ui/watch_page.dart';
import 'package:provider/provider.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavigationProvider>(
        builder: (context, provider, child) => DefaultTabController(
              length: 4,
              child: Scaffold(
                  bottomNavigationBar: Material(
                    color: Theme.of(context).primaryColor,
                    child: TabBar(
                      indicatorColor: Theme.of(context).primaryColorLight,
                      labelColor: Colors.white,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.grid_view_rounded),
                          text: 'Dashboard',
                        ),
                        Tab(
                          icon: Icon(Icons.play_circle),
                          text: 'Watch',
                        ),
                        Tab(
                          icon: Icon(Icons.file_copy_sharp),
                          text: 'Media Library',
                        ),
                        Tab(icon: Icon(Icons.list), text: 'More'),
                      ],
                    ),
                  ),
                  body: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      DashboardPage(),
                      WatchPage(),
                      MediaLibraryPage(),
                      MorePage()
                    ],
                  )),
            ));
  }
}
