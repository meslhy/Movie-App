

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/film_details/film_details.dart';
import 'package:movie_app/ui/screens/main/tabs/watched/watched_view_model.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';

class CardMoviesSearch extends StatefulWidget {

  SearchResult move;

   CardMoviesSearch(this.move, {super.key});

  @override
  State<CardMoviesSearch> createState() => _CardMoviesSearchState();
}

class _CardMoviesSearchState extends State<CardMoviesSearch> {


  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchlistCubit>(context, listen: true);
    var isWishListed = watchListCubit.moviesBox.keys.contains(widget.move.id);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder:(context) => FilmDetailsScreen("${widget.move.id}") )
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.move.backdropPath!,
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
                  watchListCubit.toggleWatchList(widget.move.id! ,
                      DetailsResponses(
                        id: widget.move.id,
                        title: widget.move.title,
                        posterPath: widget.move.posterPath,
                        releaseDate: widget.move.releaseDate,
                        overview: widget.move.overview,
                      )
                  );
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
                  widget.move.originalTitle! ,
                  style: const TextStyle(
                    color: AppColors.white ,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 4,),
                Text(
                  widget.move.releaseDate! ,
                  style: const TextStyle(
                    color: AppColors.grey ,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 4,),
                Text(
                  widget.move.overview! ,
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
    );
  }
}







