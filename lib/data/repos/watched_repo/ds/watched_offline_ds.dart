

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/movies_of_category/MoviesOfCategoryResponse.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/data/repos/details_repo/ds/details_online_ds.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/domain/repos/details_repo/ds/details_online_ds.dart';
import 'package:movie_app/domain/repos/watched_repo/ds/watched_offline_ds.dart';
import 'package:movie_app/domain/use_case/details_use_cases/get_details_use_case.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/movies_of_category/movies_of_category.dart';

@Injectable(as: WatchedOfflineDS)
class WatchedOfflineDSImpl extends WatchedOfflineDS{


  @override
  Future<Either<Failuer, List<DetailsResponses>>> getMoviesWatched() async{
    var box = await Hive.openBox("watched");

    List<DetailsResponses> moviesWatched =[] ;
    moviesWatched = box.values.map(
            (movie) => movie as DetailsResponses
    ).toList();

     if(moviesWatched.isNotEmpty){
       return right(moviesWatched);
     }else{
       return left(Failuer("not have movies watched"));
     }
  }

  @override
  void SaveMoviesWatched(String movieID , DetailsResponses movie) async{
    var box = await Hive.openBox("watched");
    await box.put(movieID, movie);
    print("done");
  }

  @override
  void deleteMoviesWatched(String id) async{
    var box = await Hive.openBox("watched");
    box.delete(id);
  }



}