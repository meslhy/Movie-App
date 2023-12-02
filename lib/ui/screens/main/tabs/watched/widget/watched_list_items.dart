import 'package:flutter/material.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/ui/utils/app_colors.dart';


class WatchListItem extends StatelessWidget {
   DetailsResponses movie;
   WatchListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height:10,
                  ),
                  Text(
                    movie.releaseDate ?? "",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.accent,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        double.parse("${movie.voteAverage}"!).toStringAsFixed(1) ?? "0",
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
