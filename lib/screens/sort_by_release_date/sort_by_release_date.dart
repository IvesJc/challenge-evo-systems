import 'package:challenge_evo_systems/commom/constants/api_configs.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/background.dart';
import 'package:challenge_evo_systems/commom/widgets/custom_app_bar.dart';
import 'package:challenge_evo_systems/commom/widgets/input_pagination.dart';
import 'package:challenge_evo_systems/commom/widgets/input_search.dart';
import 'package:challenge_evo_systems/commom/widgets/secondary_button.dart';
import 'package:challenge_evo_systems/commom/widgets/vertical_slider.dart';
import 'package:challenge_evo_systems/model/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SortByReleaseDatePage extends StatefulWidget {
  @override
  _SortByReleaseDatePageState createState() => _SortByReleaseDatePageState();
}

class _SortByReleaseDatePageState extends State<SortByReleaseDatePage> {
  final TextEditingController movieController = TextEditingController();
  final TextEditingController pageController = TextEditingController();
  List<Movie> movieList = [];
  String inputMovie = '';
  int inputPage = 1;

  Future<List<Movie>> _searchMovies(String query, int page) async {
    final url =
        '${ApiConfigs.url}/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=$page&sort_by=primary_release_date.desc';
    final response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConfigs.apiAccessToken}'
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Movie> movies = (data['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
      return movies;
    } else {
      throw Exception('Erro ao carregar filmes');
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      inputPage = page;
      _searchMovies(inputMovie, inputPage);
    });
  }

  void _onSearch() {
    setState(() {
      inputMovie = movieController.text;
      inputPage = 1; // Resetar a página ao fazer uma nova pesquisa
      _searchMovies(inputMovie, inputPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InputSearch(
                controller: movieController,
                onSearch: _onSearch,
              ),
              const SizedBox(height: 15),
              Text(
                "Order by",
                style: AppTextStyles.minTextWhite,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryButton(text: "Title", onPressed: null),
                  const SizedBox(width: 10),
                  SecondaryButton(text: "Release Date", onPressed: null),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<Movie>>(
                  future: _searchMovies(inputMovie, inputPage),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erro ao carregar filmes'),
                      );
                    } else if (snapshot.hasData) {
                      return VerticalSlider(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              PageNumberInput(
                  pageController: pageController, onPageChanged: _onPageChanged)
            ],
          ),
        ),
      ),
    );
  }
}
