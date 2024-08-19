import 'dart:convert';

import 'package:challenge_evo_systems/model/movie/movie.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {

  Future<List<Movie>> getSearchMovies() async {
        const url =
        'https://api.themoviedb.org/3/search/movie?include_adult=false&language=pt-BR&page=1api_key=69e934a01daf26db696f2e0461964a4a';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      // Handle error
      throw Exception('Erro ao carregar filmes');
    }
  }

    @override
  void initState() {
    super.initState();
    getSearchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}