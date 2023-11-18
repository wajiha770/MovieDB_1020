import 'package:movie_db/domain/config/config.dart';
import 'package:movie_db/domain/data_models/movie_details_response_model.dart';
import 'package:movie_db/domain/data_models/movie_images_response_model.dart';
import 'package:movie_db/resources/routes.dart';

import 'base_api.dart';

class MovieDetailsAPI extends BaseAPI {
  Future<MovieDetails?> getMovieDetails(String movieId) async {
    try {
      String url = "${Config.root}${Routes.movieData.url}";
      var response = await getRequest(url, urlExtension: movieId);
      if (response == null) {
        return null;
      } else {
        var model = MovieDetails.fromJson(response.data);
        model.image = await getMovieImages(movieId);
        return model;
      }
    } catch (e) {
      return null;
    }
  }

  Future<MovieImagesModel?> getMovieImages(String movieId) async {
    try {
      String url = "${Config.root}${Routes.movieData.url}";

      var response = await getRequest(url, urlExtension: '$movieId/images');
      if (response == null) {
        return null;
      } else {
        var model = MovieImagesModel.fromJson(response.data);
        return model;
      }
    } catch (e) {
      return null;
    }
  }
}
