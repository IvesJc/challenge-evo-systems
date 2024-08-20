
// import 'package:challenge_evo_systems/commom/constants/api_configs.dart';
// import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
// import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
// import 'package:challenge_evo_systems/commom/widgets/background.dart';
// import 'package:challenge_evo_systems/commom/widgets/return_button.dart';
// import 'package:challenge_evo_systems/model/movie/movie.dart';
// import 'package:flutter/material.dart';

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key, required this.movie});

//   final Movie movie;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(slivers: [
//         SliverAppBar.large(
//           leading: ReturnButton(),
//           backgroundColor: AppColors.backgroundColorDark,
//           expandedHeight: 500,
//           pinned: true,
//           floating: true,
//           flexibleSpace: FlexibleSpaceBar(
//             background: ClipRRect(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//               child: Image.network(
//                 '${ApiConfigs.imageBaseUrl}${movie.posterPath}',
//                 fit: BoxFit.cover,
//                 filterQuality: FilterQuality.high,
//               ),
//             ),
//           ),
//         ),
//         SliverFillRemaining(
//           hasScrollBody: false, // Isso garante que o conteúdo ocupe todo o espaço disponível
//           child: BackgroundContainer(
//             child: Padding(
//               padding: EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     movie.title,
//                     style: AppTextStyles.mediumTextWhite,
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 15),
//                   Text(
//                     movie.overview,
//                     style: AppTextStyles.smallTextWhite,
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 15),
//                   SizedBox(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Row(
//                             children: [
//                               Text('Release Date : ${movie.releaseDate}',
//                                   style: AppTextStyles.minTextWhite),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                   'Rating : ${movie.voteAverage.toStringAsFixed(1)}/10',
//                                   style: AppTextStyles.minTextWhite),
//                               const SizedBox(width: 5),
//                               const Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Spacer(), // Garantir que o conteúdo ocupe todo o espaço
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
import 'package:challenge_evo_systems/commom/constants/api_configs.dart';
import 'package:challenge_evo_systems/commom/constants/app_colors.dart';
import 'package:challenge_evo_systems/commom/constants/app_text_styles.dart';
import 'package:challenge_evo_systems/commom/widgets/background.dart';
import 'package:challenge_evo_systems/commom/widgets/return_button.dart';
import 'package:challenge_evo_systems/model/movie/movie.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          leading: ReturnButton(),
          backgroundColor: AppColors.backgroundColorDark,
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(
                '${ApiConfigs.imageBaseUrl}${movie.posterPath}',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: BackgroundContainer(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    movie.title,
                    style: AppTextStyles.mediumTextWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    movie.overview,
                    style: AppTextStyles.smallTextWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Spacer(), // Isso empurra o conteúdo para o topo
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text('Release Date: ${movie.releaseDate}',
                                  style: AppTextStyles.minTextWhite),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating: ${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: AppTextStyles.minTextWhite,
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
