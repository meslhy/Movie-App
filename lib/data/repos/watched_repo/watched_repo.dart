import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/repos/watched_repo/ds/watched_offline_ds.dart';
import 'package:movie_app/domain/repos/watched_repo/watched_repo.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/extensions.dart';

@Injectable(as: MoviesWatchedRepo)
class MoviesWatchedRepoImpl extends MoviesWatchedRepo {
  WatchedOfflineDS ds;
  Connectivity connectivity;

  MoviesWatchedRepoImpl(this.ds,this.connectivity);
  @override
  Future<Either<Failuer, List<DetailsResponses>>> getMoviesWatched() async{
    if(await connectivity.isInternetConnective){
      return ds.getMoviesWatched();
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  void saveMoviesWatched(String movieID , DetailsResponses detailsResponses) async{
       ds.SaveMoviesWatched(movieID , detailsResponses);
  }

  @override
  void deleteMoviesWatched(String id) {
     ds.deleteMoviesWatched(id);
  }


}