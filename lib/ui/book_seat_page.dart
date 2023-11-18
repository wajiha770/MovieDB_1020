import 'package:flutter/material.dart';
import 'package:movie_db/domain/data_models/date_model.dart';
import 'package:movie_db/domain/data_models/movie_details_response_model.dart';
import 'package:movie_db/domain/data_models/showtime_details_model.dart';
import 'package:movie_db/resources/assets_values.dart';

class BookSeatPage extends StatelessWidget {
  final MovieDetails movie;
  final ShowtimeDetails showtime;
  final DateModel date;
  const BookSeatPage(
      {super.key,
      required this.movie,
      required this.showtime,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEFEFEF),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                          movie.title!,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${date.longDate} | ${showtime.time}${showtime.hall}",
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFF61C3F2)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.asset(
                        AssetsValues.arcText,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Wrap(
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.center,
                          spacing: 4,
                          runSpacing: 4,
                          children: showtime.seats!
                              .map((seat) =>
                                  Container(width: 10, height: 10, color: seat))
                              .toList()),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              color: const Color(0xFFFFFFFF),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: const Color(0xFFCD9D0F),
                            ),
                            const Text(
                              "  Selected",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F), fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: const Color(0xFFA6A6A6),
                            ),
                            const Text(
                              "  Not available",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F), fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          children: [
                            Container(
                                width: 10,
                                height: 10,
                                color: const Color(0xFF564CA3)),
                            const Text(
                              "  VIP (150 \$)",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F), fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: const Color(0xFF61C3F2),
                            ),
                            const Text(
                              "  Regular (50 \$)",
                              style: TextStyle(
                                  color: Color(0xFF8F8F8F), fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      width: 108,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA6A6A6).withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            "/ 3 row",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          width: 108,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA6A6A6).withOpacity(0.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Total Price",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                "\$ ${showtime.costDollar}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          width: 216,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xFF61C3F2),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                              child: Text(
                            "Procees to Pay",
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
