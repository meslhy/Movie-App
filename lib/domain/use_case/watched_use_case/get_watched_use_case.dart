import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/data/model/failures.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/repos/watched_repo/watched_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class GetMoviesWatchedUseCase extends Cubit{

  MoviesWatchedRepo repo;

  GetMoviesWatchedUseCase(this.repo):super(BaseRequestInitialState());

  void execute()async{

    Either<Failuer, List<DetailsResponses>> either = await repo.getMoviesWatched();

    return either.fold(
            (error) => emit(BaseRequestErrorState(error.errorMessage)),
            (list) => emit(BaseRequestSuccessState<List<DetailsResponses>>(data: list)));
  }

}