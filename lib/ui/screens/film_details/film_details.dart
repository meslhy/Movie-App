import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/simillar_responses/SimillarResponses.dart';
import 'package:movie_app/domain/di/di.config.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/film_details/film_details_view_model.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/movies_of_category/movies_of_category.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/error_view.dart';
import 'package:movie_app/ui/widgets/card_of_film.dart';
import 'package:movie_app/ui/widgets/loading_widget.dart';


class FilmDetailsScreen extends StatefulWidget {
  String moveID;

  FilmDetailsScreen(this.moveID, {super.key});

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  FilmDetailsViewModel viewModel = getIt();
  bool enableLikeMovie = false ;
  @override
  void initState() {
    super.initState();
    viewModel.getDetails(widget.moveID);
    viewModel.getSimilarMovies(widget.moveID);
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder(
      bloc: viewModel.detailsUseCase,
      builder: (context, state) {
        if(state is BaseRequestSuccessState){
          return buildScreen(context , state.data);
        }else if(state is BaseRequestErrorState){
          return ErrorView(message: state.message);
        }else{
          return const Center(child: LoadingWidget(),);
        }
      },
    );
  }

//DetailsResponses? details
  Widget buildScreen(BuildContext context , DetailsResponses? details) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.bottomNavBar,
      title: Text(
          details!.title!
      ),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: details.backdropPath ?? AppAssets.imageTest,
            errorWidget: (_, __, ___) => Image.asset(
              AppAssets.imageTest,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
            ),
            progressIndicatorBuilder: (_, __, progress) =>const Center(
                child: LoadingWidget()),
            height: MediaQuery.of(context).size.height * .24,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 13,),
          !enableLikeMovie? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    details.title!,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  details.releaseDate!,
                  style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 10
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .24,
                  child: Row(
                    children: [
                      cardImageOfFilm(
                        context: context,
                        imagePath: details.posterPath!,
                        movieID: 0,
                        heightOfImage: MediaQuery.of(context).size.height * .24,
                        widthOfImage: MediaQuery.of(context).size.width * .31,
                        heightOfTicket: MediaQuery.of(context).size.height * .05,
                        widthOfTicket: MediaQuery.of(context).size.width * .08,
                        inDetails: true,
                        movie: details,
                      ),
                      const SizedBox(width: 11,),
                      Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height:MediaQuery.of(context).size.height *.05,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListView.separated(
                                        itemBuilder:(context,index)=> buildGenresItem(details.genres![index]),
                                        separatorBuilder: (context, index) =>const SizedBox(width: 5,),
                                        itemCount: details.genres!.length,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Text(
                                details.overview!,
                                style:const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.grey
                                ),
                                maxLines: 6,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: AppColors.accent,size: 30,),
                                  const SizedBox(width: 10,),
                                  Text(
                                      "${details.voteAverage!}",
                                      style:const TextStyle(
                                          fontSize: 18,
                                          color: AppColors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 18,),
              ],
            ),
          ):const SizedBox(height: 5,),
          BlocBuilder(
            bloc: viewModel.similarUseCase,
            builder: (context, state) {
              if(state is BaseRequestSuccessState){
                return buildMoreLikeList(context , state.data);
              }else if(state is BaseRequestErrorState){
                return ErrorView(message: state.message);
              }else{
                return const Center(child: LoadingWidget(),);
              }
            },
          ),

          //buildMoreLikeList(context),
        ],
      ),
    ),
  );
  }

//List<SimilarResult> result
  Widget buildMoreLikeList(BuildContext context ,List<SimilarResult> result ) => Container(
    height:enableLikeMovie? MediaQuery.of(context).size.height * .7 :MediaQuery.of(context).size.height * .34,
    color: AppColors.backgroundList,
    child: Padding(
      padding: const EdgeInsets.only(left: 22.0 , ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 13,),
          InkWell(
            onTap: () {
              enableLikeMovie = !enableLikeMovie;
              setState(() {});
            },
            child:  Row(
                children: [
                   const Text(
                "More Like This",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                ),
              ),
                  const Spacer(),
                   const Text(
                "More ",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                ),
              ),
                  Icon( enableLikeMovie? Icons.arrow_drop_down_sharp:Icons.arrow_drop_up_sharp,color: AppColors.white,),
                  const SizedBox(width: 10,)
            ]
            ),
          ),
          const SizedBox(height: 13,),
          SizedBox(
            height: enableLikeMovie? MediaQuery.of(context).size.height * .6 : MediaQuery.of(context).size.height * .27,
            child: GridView.builder(
              physics: enableLikeMovie? const PageScrollPhysics() : const NeverScrollableScrollPhysics(),
              itemCount: result.length,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 0.5),
              itemBuilder: (context, index) =>Column(
                children: [
                  cardImageOfFilm(
                      context: context,
                      imagePath: result[index].posterPath ?? AppAssets.imageTest,
                      withDetails: true,
                      movieID: result[index].id!,
                    movie: DetailsResponses(
                      id: result[index].id,
                      title: result[index].title,
                      posterPath: result[index].posterPath,
                      releaseDate: result[index].releaseDate,
                      overview: result[index].overview,
                    ),

                  ),
                  Container(
                    height:MediaQuery.of(context).size.height * .09,
                    width:  MediaQuery.of(context).size.width * .26,
                    color: AppColors.blackGrey,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star , color: AppColors.accent , size: 20,),
                            const SizedBox(width: 3,),
                            Text(
                              "${result[index].voteAverage!}",
                              style:const TextStyle(color: AppColors.white , fontSize: 10),
                            ),


                          ],
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          result[index].originalTitle!,
                          style:const TextStyle(color: AppColors.white , fontSize: 10),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          result[index].releaseDate!,
                          style:const TextStyle(color: AppColors.grey , fontSize: 10),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ) ,
            ),
          ),
        ],
      ),
    ),
  );

  buildGenresItem(Genres genre){
    return InkWell(
      onTap: () {
        Navigator.push(

            context,
            MaterialPageRoute(builder:(context) => MoviesOfCategory(categoryName: genre.name!,categoryID:"${genre.id!}",) )
        );
      },
      child: Container(
        padding:const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.accent),
            borderRadius: BorderRadiusDirectional.circular(10),

        ),
        child: Text(
          genre.name??"",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
