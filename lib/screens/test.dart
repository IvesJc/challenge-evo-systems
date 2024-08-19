import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/backgroud.dart';
import 'package:challenge_evo_systems/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _movies = [];
  int _page = 1;

  void _fetchMovies() async {
    final url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=$_page&sort_by=title.asc&api_key=69e934a01daf26db696f2e0461964a4a';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Número da página',
                  labelStyle: AppTextStyles.minTextWhite,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: AppColors.white),
                    onPressed: () {
                      setState(() {
                        _page = int.tryParse(_controller.text) ?? 1;
                        _fetchMovies();
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                      movie: _movies[index],
                                    )),
                          );
                        },
                        child: ListTile(
                          leading: Image.network(
                            'https://image.tmdb.org/t/p/w500${_movies[index]['poster_path']}',
                            width: 50,
                            scale: 5,
                            fit: BoxFit.fitHeight,
                          ),
                          title: Text(_movies[index]['title'],
                              style: AppTextStyles.minTextWhite),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
