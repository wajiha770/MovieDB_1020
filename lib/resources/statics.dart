import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_db/domain/data_models/date_model.dart';
import 'package:movie_db/domain/data_models/genre_model.dart';
import 'package:movie_db/domain/data_models/showtime_details_model.dart';

class Statics {
  static List<GenreModel> genres = [
    GenreModel(name: "Comedies", color: const Color(0xFF15D2BC)),
    GenreModel(name: "Crime", color: const Color(0xFFE26CA5)),
    GenreModel(name: "Family", color: const Color(0xFF564CA3)),
    GenreModel(name: "Documentaries", color: const Color(0xFFCD9D0F)),
    GenreModel(name: "Drama", color: const Color(0xFF61C3F2)),
    GenreModel(name: "Fantasy", color: const Color(0xFF15D2BC)),
    GenreModel(name: "Holidays", color: const Color(0xFFE26CA5)),
    GenreModel(name: "Horror", color: const Color(0xFF564CA3)),
    GenreModel(name: "Science", color: const Color(0xFFCD9D0F)),
    GenreModel(name: "Thriller", color: const Color(0xFF15D2BC)),
    GenreModel(name: "Action", color: const Color(0xFFE26CA5)),
    GenreModel(name: "Fiction", color: const Color(0xFF564CA3)),
  ];

  static List<Color> seatColors = const [
    Color(0xFFCD9D0F),
    Color(0xFF61C3F2),
    Color(0xFFA6A6A6),
    Color(0xFF564CA3)
  ];

  static List<DateModel> dates = [
    DateModel(shortDate: "5 Mar", longDate: "March 5, 2021"),
    DateModel(shortDate: "6 Mar", longDate: "March 6, 2021"),
    DateModel(shortDate: "7 Mar", longDate: "March 7, 2021"),
    DateModel(shortDate: "8 Mar", longDate: "March 8, 2021"),
    DateModel(shortDate: "9 Mar", longDate: "March 9, 2021"),
    DateModel(shortDate: "10 Mar", longDate: "March 10, 2021"),
    DateModel(shortDate: "11 Mar", longDate: "March 11, 2021"),
    DateModel(shortDate: "12 Mar", longDate: "March 12, 2021"),
  ];

  static List<ShowtimeDetails> showtimes = [
    ShowtimeDetails(
        time: "12:30 ",
        hall: "Hall 1",
        costDollar: "50",
        costBonus: "2500 bonus ",
        seats: List.generate(
            200,
            (index) =>
                seatColors[Random().nextInt(Statics.seatColors.length)])),
    ShowtimeDetails(
        time: "13:30 ",
        hall: "Hall 2",
        costDollar: "75",
        costBonus: "3000 bonus",
        seats: List.generate(
            150,
            (index) =>
                seatColors[Random().nextInt(Statics.seatColors.length)])),
    ShowtimeDetails(
        time: "14:30 ",
        hall: "Hall 1",
        costDollar: "60",
        costBonus: "2000 bonus",
        seats: List.generate(210,
            (index) => seatColors[Random().nextInt(Statics.seatColors.length)]))
  ];
}
