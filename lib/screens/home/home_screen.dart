import 'package:challenge_evo_systems/api/api.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/background.dart';
import 'package:challenge_evo_systems/commom/widgets/custom_app_bar_search.dart';
import 'package:challenge_evo_systems/commom/widgets/now_playing_slider.dart';
import 'package:challenge_evo_systems/commom/widgets/regular_slider.dart';
import 'package:challenge_evo_systems/model/movie/movie.dart';
import 'package:challenge_evo_systems/screens/search/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> popularMovies;

// initState() : runs as soon as the app builds
  @override
  void initState() {
    super.initState();
    nowPlayingMovies = Api().getNowPlayingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().getTopRatedMovies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWithSearchIcon(
          onSearchPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => MovieSearchPage()),);
          },
        ),
        body: BackgroundContainer(
          child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Now Playing',
                  style: AppTextStyles.mediumTextWhite,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  child: FutureBuilder(
                    future: nowPlayingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Erro ao carregar filmes'),
                        );
                      } else if (snapshot.hasData) {
                        return NowPlayingSlider(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Text('Top Rated Movies', style: AppTextStyles.mediumTextWhite),
                const SizedBox(height: 30),
                SizedBox(
                  child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Erro ao carregar filmes'),
                        );
                      } else if (snapshot.hasData) {
                        return RegularSlider(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Text('Popular Movies', style: AppTextStyles.mediumTextWhite),
                const SizedBox(height: 30),
                SizedBox(
                  child: FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Erro ao carregar filmes'),
                        );
                      } else if (snapshot.hasData) {
                        return RegularSlider(snapshot: snapshot);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                // const Slider(),
              ],
            ),
          ),
        )));
  }
}

