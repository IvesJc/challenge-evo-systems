import 'dart:convert';

import 'package:challenge_evo_systems/commom/constants/api_configs.dart';
import 'package:challenge_evo_systems/model/movie/movie.dart';

import 'package:http/http.dart' as http;

class Api {
  static String urlNowPlaying =
      '${ApiConfigs.url}/movie/now_playing?language=pt-BR&page=1';

  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(urlNowPlaying),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConfigs.apiAccessToken}'
    });

    if (response.statusCode == 200) {
      final decodedData = (jsonDecode(response.body)['results'] as List);
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Erro ao carregar filmes');
    }
  }
}
