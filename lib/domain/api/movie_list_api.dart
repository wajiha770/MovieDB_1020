import 'package:movie_db/domain/config/config.dart';
import 'package:movie_db/domain/data_models/movie_list_response_model.dart';
import 'package:movie_db/resources/routes.dart';

import 'base_api.dart';

class MovieListAPI extends BaseAPI {
  Future<MovieListResponseModel?> getMovieList() async {
    try {
      String url = "${Config.root}${Routes.movieList.url}";

      var response = await getRequest(url);
      if (response == null) {
        return null;
      } else {
        var model = MovieListResponseModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      return null;
    }
  }
}
