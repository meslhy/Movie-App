import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';

abstract class MoviesWatchedRepo{

  Future<Either<Failuer,List<DetailsResponses>>> getMoviesWatched();

  void saveMoviesWatched(String movieID , DetailsResponses movie);

  void deleteMoviesWatched(String id);

}