import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/film_details/film_details.dart';
import 'package:movie_app/ui/screens/main/tabs/watched/watched_view_model.dart';
import 'package:movie_app/ui/screens/main/tabs/watched/widget/watched_list_items.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/error_view.dart';
import 'package:movie_app/ui/widgets/card_of_movies_search.dart';
import 'package:movie_app/ui/widgets/loading_widget.dart';

class WatchedScreen extends StatefulWidget {

  @override
  State<WatchedScreen> createState() => _WatchedScreenState();
}

class _WatchedScreenState extends State<WatchedScreen> {

  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchlistCubit>(context, listen: true);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50,),
        const Text(
          "Movies to watched",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 20,),
        watchListCubit.movies.isNotEmpty?
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) =>SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: buildWatchedMoviesItem(watchListCubit.movies[index] , watchListCubit),
                ),
              ),
              separatorBuilder: (context, index) => Container(height: 1, width:MediaQuery.of(context).size.width * .8, color: AppColors.grey,),
              itemCount: watchListCubit.movies.length
          ),
        ) :
        Expanded(
          child: Center(
              child: Text(
                "not movies to watch it",
                style: TextStyle(
                  color: AppColors.accent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold

                ),
              ),
            ),
        ),

      ],
    );
  }

  buildWatchedMoviesItem(DetailsResponses movie , var watchListCubit ) {
    var isWishListed = watchListCubit.moviesBox.keys.contains(movie.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => FilmDetailsScreen("${movie.id}") )
          );
        },
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: movie.posterPath??"",
                    errorWidget: (_, __, ___) => Image.asset(
                      AppAssets.imageTest,
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .4,
                      fit: BoxFit.cover,
                    ),
                    progressIndicatorBuilder: (_, __, progress) => Center(
                        child: CircularProgressIndicator(value: progress.progress,)),
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .4,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: (){
                    watchListCubit.toggleWatchList(movie.id!,movie);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(10) ,
                      topEnd: Radius.circular(10) ,
                    ),
                    child: !isWishListed? Image.asset(
                        "assets/images/bookmark1.png"
                    ):Image.asset(
                        "assets/images/bookmark.png"
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title! ,
                    style: const TextStyle(
                      color: AppColors.white ,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    movie.releaseDate! ,
                    style: const TextStyle(
                      color: AppColors.grey ,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    movie.overview! ,
                    style: const TextStyle(
                      color: AppColors.grey ,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
          ),
      ),
    );
  }


}
