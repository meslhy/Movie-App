import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/film_details/film_details.dart';
import 'package:movie_app/ui/screens/main/tabs/watched/watched_view_model.dart';
import 'package:movie_app/ui/utils/app_assets.dart';



//todo:convert this fun to widget......to add bloc


class cardImageOfFilm extends StatefulWidget {

  DetailsResponses movie;
   BuildContext context ;
   String imagePath ;
  bool withDetails;
  int movieID ;
  double heightOfImage ;
  double widthOfImage ;
  double heightOfTicket ;
  double widthOfTicket ;
  bool inDetails ;
  bool inWatched ;

   cardImageOfFilm({
    super.key,
    required this.context,
    required this.imagePath,
    this.withDetails = false,
    required this.movieID,
    this.heightOfImage = 0,
    this.widthOfImage = 0,
    this.heightOfTicket = 0,
    this.widthOfTicket = 0,
    this.inDetails = false,
     this.inWatched = false,
     required this.movie,

  });

  @override
  State<cardImageOfFilm> createState() => _cardImageOfFilmState();
}

class _cardImageOfFilmState extends State<cardImageOfFilm> {

  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchlistCubit>(context, listen: true);
    var isWishListed = watchListCubit.moviesBox.keys.contains(widget.movieID);
    return Stack(
      children: [
        InkWell(
          onTap: (){
            if(widget.inDetails ==false){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => FilmDetailsScreen("${widget.movie.id}") )
              );
            }
          },
          child: ClipRRect(

            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10) ,
              topEnd: Radius.circular(10) ,
              bottomStart:widget.withDetails? Radius.zero: Radius.circular(10) ,
              bottomEnd:widget.withDetails? Radius.zero: Radius.circular(10) ,
            ),

            child: CachedNetworkImage(
              imageUrl: widget.movie.posterPath!,
              errorWidget: (_, __, ___) => Image.asset(
                AppAssets.imageTest,
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width * .4,
                fit: BoxFit.cover,
              ),
              height: widget.heightOfImage ==0? MediaQuery.of(context).size.height * .18 : widget.heightOfImage,
              width: widget.widthOfImage==0? MediaQuery.of(context).size.width * .26 : widget.widthOfImage,
              fit: BoxFit.cover,
            ),

          ),
        ),
        if(!widget.inDetails)
         InkWell(
            onTap: (){
              watchListCubit.toggleWatchList(widget.movie.id!, widget.movie);
            },
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10) ,
                topEnd: Radius.circular(10) ,
                bottomStart:widget.withDetails? Radius.zero: Radius.circular(10) ,
                bottomEnd:widget.withDetails? Radius.zero: Radius.circular(10) ,
              ),
              child: Image.asset(
                isWishListed?
                "assets/images/bookmark.png" : "assets/images/bookmark1.png"
              ),
            ),
          ),
      ],

    );
  }
}

