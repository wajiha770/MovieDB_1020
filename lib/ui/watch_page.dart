import 'package:flutter/material.dart';
import 'package:movie_db/domain/api/movie_details_api.dart';
import 'package:movie_db/domain/data_models/movie_details_response_model.dart';
import 'package:movie_db/provider/main_navigation_provider.dart';
import 'package:movie_db/resources/statics.dart';
import 'package:movie_db/ui/movie_details_page.dart';
import 'package:movie_db/ui/search_widget.dart';
import 'package:provider/provider.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavigationProvider>(
        builder: (context, provider, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Watch",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: SearchWidget(
                                        provider.moviesList, Statics.genres));
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade300,
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            shrinkWrap: true,
                            itemCount: provider.moviesList.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () async {
                                    MovieDetails? movieDetails =
                                        await MovieDetailsAPI().getMovieDetails(
                                            provider.moviesList[index].id
                                                .toString());
                                    if (movieDetails != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailsPage(
                                                    movie: movieDetails),
                                          ));
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF15D2BC),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 150,
                                    child: Center(
                                      child: Text(
                                        provider.moviesList[index].title,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
