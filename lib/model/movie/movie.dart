class Movie {
  String title;
  String originalTitle;
  String backDropPath;
  String posterPath;
  String overview;
  String releaseDate;
  double voteAverage;

  Movie(
      {required this.title,
      required this.originalTitle,
      required this.backDropPath,
      required this.posterPath,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        originalTitle: json["original_title"] ,
        backDropPath: json["backdrop_path"] ,
        posterPath: json["poster_path"] ,
        overview: json["overview"] ,
        releaseDate: json["release_date"] ,
        voteAverage: json["vote_average"] 
      );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'title': title,
  //     'originalTitle': originalTitle,
  //     'backDropPath': backDropPath,
  //     'posterPath': posterPath,
  //     'overview': overview,
  //     'releaseDate': releaseDate,
  //     'voteAverage': voteAverage
  //   };
  // }

}
