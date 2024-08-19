import 'dart:convert';

import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/backgroud.dart';
import 'package:challenge_evo_systems/model/movie/movie.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AllMovies extends StatefulWidget {
  const AllMovies({super.key});

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  // late Future<List<Movie>> allMoviesByTitleAsc;
  final TextEditingController _controller = TextEditingController();
  int _page = 1;
  List<dynamic> _movies = [];

  Future<List<Movie>> _fetchMovies() async {
    final url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=$_page&sort_by=title.asc&api_key=69e934a01daf26db696f2e0461964a4a';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _movies = data['results'] as List;
      });
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      // Handle error
      throw Exception('Erro ao carregar filmes');
    }
  }

  @override
  void initState() {
    super.initState();
    // allMoviesByTitleAsc = Api().getAllMoviesByTitleAsc();
    _fetchMovies();
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
                          labelText: 'Número da página',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                _page = int.tryParse(_controller.text) ?? 1;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      // SizedBox(
                      //   child: FutureBuilder(
                      //     future: _fetchMovies(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasError) {
                      //         return Center(
                      //           child: Text('Erro ao carregar filmes'),
                      //         );
                      //       } else if (snapshot.hasData) {
                      //         return VerticalSlider(snapshot: snapshot);
                      //       } else {
                      //         return const Center(
                      //             child: CircularProgressIndicator());
                      //       }
                      //     },
                      //   ),
                      // ),
                      ListView.builder(
                        itemCount: _movies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_movies[index]['title']),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   child: FutureBuilder(
                //     future: allMoviesByTitleAsc,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasError) {
                //         return Center(
                //           child: Text('Erro ao carregar filmes'),
                //         );
                //       } else if (snapshot.hasData) {
                //         return VerticalSlider(snapshot: snapshot);
                //       } else {
                //         return const Center(child: CircularProgressIndicator());
                //       }
                //     },
                //   ),
                // ),
                // const SizedBox(height: 30),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         width: 100,
                //         child: TextField(
                //             style: AppTextStyles.minTextWhite,
                //             controller: _controller,
                //             decoration: InputDecoration(
                //               border: OutlineInputBorder(),
                //               suffixIcon: IconButton(
                //                 icon: Icon(Icons.search),
                //                 onPressed: () {
                //                   setState(() {
                //                     _page = int.tryParse(_controller.text) ?? 1;
                //                     print(_page);
                //                   });
                //                   _fetchMovies();
                //                 },
                //               ),
                //             ),
                //             keyboardType: TextInputType.number),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
