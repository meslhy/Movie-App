import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/movies_of_category/MoviesOfCategoryResponse.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/film_details/film_details.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/movies_of_category/movies_of_category_view_model.dart';
import 'package:movie_app/ui/screens/main/tabs/watched/watched_view_model.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/error_view.dart';
import 'package:movie_app/ui/widgets/loading_widget.dart';

class MoviesOfCategory extends StatefulWidget {

  String categoryID;
  String categoryName;

   MoviesOfCategory({super.key, required this.categoryID , required this.categoryName});

  @override
  State<MoviesOfCategory> createState() => _MoviesOfCategoryState();
}

class _MoviesOfCategoryState extends State<MoviesOfCategory> {
  MoviesOfCategoryViewModel viewModel = getIt();

  @override
  void initState() {
    viewModel.getMovies(widget.categoryID);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var watchListCubit = BlocProvider.of<WatchlistCubit>(context, listen: true);
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .08,),
          Text(
            "${widget.categoryName} Movies",
            style: const TextStyle(
              color: AppColors.accent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .04,),
          BlocBuilder(
            bloc: viewModel.moviesOfCategoryUseCase,
            builder: (context, state) {
              if(state is BaseRequestSuccessState){
                return buildListView(context, state.data , watchListCubit);
              }else if(state is BaseRequestErrorState){
                return ErrorView(message: state.message);
              }else{
                return const LoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }

  // Expanded(
  Widget buildListView(BuildContext context , List<MoviesResults> move ,var watchListCubit) {

    return Expanded(
    child: ListView.separated(
        itemBuilder: (context, index) =>buildCardOfMovie(move[index],watchListCubit),
        separatorBuilder: (context, index) => Container(height: 1,width:MediaQuery.of(context).size.width * .8, color: AppColors.grey,),
        itemCount: move.length
    ),
  );
  }

  buildCardOfMovie(MoviesResults move , var watchListCubit) {
    var isWishListed = watchListCubit.moviesBox.keys.contains(move.id);
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => FilmDetailsScreen("${move.id!}")
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:move.backdropPath ??AppAssets.notFoundImage,
                      errorWidget: (_, __, ___) => Image.asset(
                        AppAssets.imageTest,
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width * .3,
                        fit: BoxFit.cover,
                      ),
                      progressIndicatorBuilder: (_, __, progress) => Center(
                          child: CircularProgressIndicator(value: progress.progress,)),
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          move.originalTitle! ,
                          style: const TextStyle(
                            color: AppColors.white ,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4,),
                        Text(
                          move.releaseDate! ,
                          style: const TextStyle(
                            color: AppColors.grey ,
                            fontSize: 10,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4,),
                        Text(
                          move.overview! ,
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
            InkWell(
              onTap: (){
                watchListCubit.toggleWatchList(move.id! ,
                    DetailsResponses(
                      id: move.id,
                      title: move.title,
                      posterPath: move.posterPath,
                      releaseDate: move.releaseDate,
                      overview: move.overview,
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
      ),
    );
  }
}
