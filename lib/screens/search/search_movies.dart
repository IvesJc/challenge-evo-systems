import 'dart:convert';

import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/backgroud.dart';
import 'package:challenge_evo_systems/model/movie/movie.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {

  final TextEditingController _controller = TextEditingController();
  int _page = 1;
  String _query = '';
  List<dynamic> _movies = [];

  void getSearchMovies() async {
        final url =
        'https://api.themoviedb.org/3/search/movie?query=$_query&include_adult=false&pt-BR&page=$_page&api_key=69e934a01daf26db696f2e0461964a4a';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // data.map((movie) => Movie.fromJson(movie)).toList();
      setState(() {
        _movies = data['results'];
      });
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColorDark,
          elevation: 0,
          title: Image(
              image: AssetImage('assets/images/ivesflix.png'),
              fit: BoxFit.cover,
              height: 40,
              filterQuality: FilterQuality.high),
        ),
              body: BackgroudContainer(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('All Movies', style: AppTextStyles.mediumTextWhite),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Pesquisar',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                _query = _controller.text;
                                getSearchMovies();
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Número da página',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                _page = int.tryParse(_controller.text) ?? 1;
                                getSearchMovies();
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ]
                  )
                )
              ]
            )
          )
        )
              )
    );
  }
}