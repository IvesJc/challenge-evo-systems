import 'package:carousel_slider/carousel_slider.dart';
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

    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 200; 
    double viewportFraction = itemWidth / screenWidth;


    return SizedBox(
      height: 225,
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          options: CarouselOptions(
            height: 300,
            viewportFraction:  viewportFraction.clamp(0.1, 0.5),
          ),
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
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
                  height: 300,
                  width: 200,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitHeight,
                    '${ApiConfigs.imageBaseUrl}${snapshot.data[index].posterPath}',
                  ),
                ),
              ),
            );
          }),

    );
      // Scrollbar(
      //   child: 
      //   ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     physics: BouncingScrollPhysics(),
      //     itemCount: snapshot.data.length,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: EdgeInsets.only(left: 8.0, right: index == snapshot.data.length - 1 ? 8 : 0),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => DetailsScreen(
      //                         movie: snapshot.data[index],
      //                       )),
      //             );
      //           },
      //           child: ClipRRect(
      //             borderRadius: BorderRadius.circular(12),
      //             child: SizedBox(
      //               height: 225,
      //               width: 150,
      //               child: Image.network(
      //                 '${ApiConfigs.imageBaseUrl}${snapshot.data[index].posterPath}',
      //                 filterQuality: FilterQuality.high,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      // ),
  }
}
