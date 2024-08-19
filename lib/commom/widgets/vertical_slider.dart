import 'package:challenge_evo_systems/commom/constants/api_configs.dart';
import 'package:challenge_evo_systems/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class VerticalSlider extends StatelessWidget {
  const VerticalSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.tryParse(snapshot.data.length.toString())! * 225,
      width: double.maxFinite,
      child:
          // ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   shrinkWrap: true,
          //   physics: BouncingScrollPhysics(),
          GridView.builder(
        itemCount: snapshot.data.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
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
