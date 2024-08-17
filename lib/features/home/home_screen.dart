import 'package:challenge_evo_systems/api/api.dart';
import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/backgroud.dart';
import 'package:challenge_evo_systems/commom/widgets/now_playing_slider.dart';
import 'package:challenge_evo_systems/model/movie/movie.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> nowPlayingMovies;

// initState() : runs as soon as the app builds
  @override
  void initState() {
    super.initState();
    nowPlayingMovies = Api().getNowPlayingMovies();
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
                )
              ],
            ),
          ),
        )));
  }
}