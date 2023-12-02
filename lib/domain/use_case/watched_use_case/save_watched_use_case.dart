import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/domain/repos/watched_repo/watched_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class SaveMoviesWatchedUseCase extends Cubit{

  MoviesWatchedRepo repo;

  SaveMoviesWatchedUseCase(this.repo):super(BaseRequestInitialState());

  void execute(String movieID , DetailsResponses detailsResponses)async{

     emit(BaseRequestLoadingState());
     repo.saveMoviesWatched(movieID , detailsResponses);
     emit(BaseRequestSuccessState());
  }

}