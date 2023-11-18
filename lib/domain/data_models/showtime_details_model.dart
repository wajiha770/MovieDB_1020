import 'package:flutter/material.dart';

class ShowtimeDetails {
  String? time;
  String? hall;
  String? costDollar;
  String? costBonus;
  List<Color>? seats;

  ShowtimeDetails(
      {this.time, this.hall, this.costDollar, this.costBonus, this.seats});
}
