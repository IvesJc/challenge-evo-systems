import 'package:challenge_evo_systems/commom/constants/api_configs.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NowPlayingSlider extends StatelessWidget {
  const NowPlayingSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        ),
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                '${ApiConfigs.imageBaseUrl}${snapshot.data[index].posterPath}',
              ),
            ),
          );
          }
      ),
    );
  }
}
