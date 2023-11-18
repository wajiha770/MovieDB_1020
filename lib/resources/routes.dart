enum Routes {
  movieList,
  movieData,
}

extension StaticRoutes on Routes {
  static const _routeModel = {
    Routes.movieList: "/movie/upcoming",
    Routes.movieData: "/movie/",
  };

  String get url => _routeModel[this] ?? "";
}
