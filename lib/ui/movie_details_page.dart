import 'package:flutter/material.dart';
import 'package:movie_db/domain/data_models/movie_details_response_model.dart';
import 'package:movie_db/resources/statics.dart';
import 'package:movie_db/ui/get_tickets_page.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieDetails movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 500,
          color: const Color(0xFF564CA3),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Text(
                    "Watch",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Spacer(),
              Text(
                movie.title!,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "In Theaters ${movie.releaseDate.toString().split(" ").first}",
                style: const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetTicketsPage(
                          movie: movie,
                        ),
                      ));
                },
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF61C3F2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                      child: Text(
                    "Get Tickets",
                    style: TextStyle(fontSize: 16),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF61C3F2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        size: 20,
                      ),
                      Text(
                        " Watch Trailer",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Genres",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movie.genres!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Statics.genres
                        .firstWhere((element) =>
                            element.name == movie.genres?[index].name)
                        .color,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child:
                      Center(child: Text(movie.genres![index].name.toString())),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              }),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Overview",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            movie.overview!,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
      ]),
    );
  }
}
