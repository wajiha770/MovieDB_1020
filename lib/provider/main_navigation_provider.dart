import 'package:flutter/material.dart';
import 'package:movie_db/domain/api/movie_list_api.dart';
import 'package:movie_db/domain/data_models/movie_list_response_model.dart';
import 'package:movie_db/domain/data_models/movie_model.dart';

class MainNavigationProvider extends ChangeNotifier {
  MainNavigationProvider() {
    getMovieList();
  }
  int selectedIndex = 1;

  List<Movie> moviesList = [];

  /// changes selected tab of bottom navigation
  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> getMovieList() async {
    MovieListResponseModel? model = await MovieListAPI().getMovieList();
    if (model != null) {
      moviesList = model.results;
    }
  }
}
