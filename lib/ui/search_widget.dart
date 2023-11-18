import 'package:flutter/material.dart';
import 'package:movie_db/domain/api/movie_details_api.dart';
import 'package:movie_db/domain/data_models/genre_model.dart';
import 'package:movie_db/domain/data_models/movie_details_response_model.dart';
import 'package:movie_db/domain/data_models/movie_model.dart';
import 'package:movie_db/ui/movie_details_page.dart';

class SearchWidget extends SearchDelegate<String> {
  List<Movie> moviesList;
  List<Movie> finalList = [];
  List<GenreModel> genres = [];
  SearchWidget(this.moviesList, this.genres);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  ///build results based on initial list
  @override
  Widget buildResults(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: genres
          .map((e) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFFE26CA5),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  e.name,
                  style: const TextStyle(color: Colors.black),
                )),
              ))
          .toList(),
    );
  }

  ///builds suggestions based on query string
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Movie> filteredList = moviesList;
    filteredList = query.isEmpty
        ? filteredList
        : filteredList
            .where((object) =>
                object.title.toUpperCase().contains(query.toUpperCase()))
            .toList();
    if (filteredList.isNotEmpty) {
      finalList = filteredList;
    } else {
      finalList = moviesList;
    }
    if (query.isEmpty) {
      return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: genres
            .map((e) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: e.color,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      e.name,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    )),
                  ),
                ))
            .toList(),
      );
    } else {
      return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: finalList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                MovieDetails? movieDetails = await MovieDetailsAPI()
                    .getMovieDetails(finalList[index].id.toString());
                if (movieDetails != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsPage(movie: movieDetails),
                      ));
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color(0xFFCD9D0F),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            finalList[index].title,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          const Text(
                            "--genre--",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF61C3F2),
                                  borderRadius: BorderRadius.circular(90)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF61C3F2),
                                  borderRadius: BorderRadius.circular(90)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF61C3F2),
                                  borderRadius: BorderRadius.circular(90)),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            );
          });
    }
  }
}
