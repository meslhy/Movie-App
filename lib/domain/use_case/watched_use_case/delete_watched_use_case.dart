import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/repos/watched_repo/watched_repo.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';

@injectable
class DeleteMoviesWatchedUseCase extends Cubit{

  MoviesWatchedRepo repo;

  DeleteMoviesWatchedUseCase(this.repo):super(BaseRequestInitialState());

  void execute(String id)async{

    emit(BaseRequestLoadingState());
    repo.deleteMoviesWatched(id);
    emit(BaseRequestSuccessState());
  }

}