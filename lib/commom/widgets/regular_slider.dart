import 'package:challenge_evo_systems/commom/constants/api_configs.dart';
import 'package:challenge_evo_systems/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class RegularSlider extends StatelessWidget {
  const RegularSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            movie: snapshot.data[index],
                          )),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 225,
                  width: 150,
                  child: Image.network(
                    '${ApiConfigs.imageBaseUrl}${snapshot.data[index].posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
