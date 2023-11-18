import 'package:flutter/material.dart';
import 'package:movie_db/domain/data_models/movie_details_response_model.dart';
import 'package:movie_db/resources/assets_values.dart';
import 'package:movie_db/resources/statics.dart';
import 'package:movie_db/ui/book_seat_page.dart';

class GetTicketsPage extends StatefulWidget {
  final MovieDetails movie;

  const GetTicketsPage({super.key, required this.movie});

  @override
  State<GetTicketsPage> createState() => _GetTicketsPageState();
}

class _GetTicketsPageState extends State<GetTicketsPage> {
  var selectedDate = Statics.dates.first;
  var selectedShowtime = Statics.showtimes.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEFEFEF),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFFFFFFFF),
              height: 120,
              padding: const EdgeInsets.only(top: 40),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.movie.title!,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "In Theaters ${widget.movie.releaseDate.toString().split(" ").first}",
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFF61C3F2)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Date",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Statics.dates
                        .map((date) => MaterialButton(
                              onPressed: () {
                                setState(() {
                                  selectedDate = date;
                                });
                              },
                              child: Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: selectedDate == date
                                      ? const Color(0xFF61C3F2)
                                      : const Color(0xFFA6A6A6)
                                          .withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Center(
                                    child: Text(
                                  date.shortDate!,
                                  style: TextStyle(
                                      color: selectedDate == date
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12),
                                )),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Statics.showtimes
                        .map((showtime) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        showtime.time!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        " Cintech + ${showtime.hall}",
                                        style: const TextStyle(
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedShowtime = showtime;
                                      });
                                    },
                                    child: Container(
                                      width: 250,
                                      height: 140,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFF61C3F2),
                                            width: selectedShowtime == showtime
                                                ? 3
                                                : 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            AssetsValues.arc,
                                            width: 200,
                                            height: 50,
                                          ),
                                          Wrap(
                                              direction: Axis.horizontal,
                                              runAlignment:
                                                  WrapAlignment.center,
                                              alignment: WrapAlignment.center,
                                              spacing: 4,
                                              runSpacing: 4,
                                              children: showtime.seats!
                                                  .map((seat) => Container(
                                                      width: 4,
                                                      height: 4,
                                                      color: seat))
                                                  .toList()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "From ",
                                        style: TextStyle(
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "${showtime.costDollar}\$ ",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "To ",
                                        style: TextStyle(
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 12),
                                      ),
                                      Text(
                                        showtime.costBonus!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookSeatPage(
                          movie: widget.movie,
                          showtime: selectedShowtime,
                          date: selectedDate,
                        ),
                      ));
                },
                child: Container(
                  width: 320,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF61C3F2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                      child: Text(
                    "Select Seats",
                    style: TextStyle(fontSize: 16),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
