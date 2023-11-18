class MovieImagesModel {
  MovieImagesModel({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  List<Backdrop> backdrops;
  int id;
  List<Backdrop> logos;
  List<Backdrop> posters;

  factory MovieImagesModel.fromJson(Map<String, dynamic> json) =>
      MovieImagesModel(
        backdrops: List<Backdrop>.from(
            json["backdrops"].map((x) => Backdrop.fromJson(x))),
        id: json["id"],
        logos:
            List<Backdrop>.from(json["logos"].map((x) => Backdrop.fromJson(x))),
        posters: List<Backdrop>.from(
            json["posters"].map((x) => Backdrop.fromJson(x))),
      );
}

class Backdrop {
  Backdrop({
    required this.aspectRatio,
    required this.height,
    this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  double aspectRatio;
  int height;
  String? iso6391;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );
}
