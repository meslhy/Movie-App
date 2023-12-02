import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistInitilal());
  Box moviesBox = Hive.box<DetailsResponses>("moviesBox");

  List<DetailsResponses> movies = [];
  void populateList() {
    movies = moviesBox.values.map((movie) => movie as DetailsResponses).toList();
  }

  void toggleWatchList(int movieId, DetailsResponses movieDetails) async {
    if (moviesBox.keys.contains(movieId)) {
      await removeItemFromDataBase(movieId);

      emit(NotWatchlisted());
    } else {
      await addItemToDataBase(movieId, movieDetails);

      emit(Watchlisted());
    }
  }

  Future<void> addItemToDataBase(int movieId, DetailsResponses movieDetails) async {
    await moviesBox.put(movieId, movieDetails);
    populateList();
  }

  Future<void> removeItemFromDataBase(int movieId) async {
    await moviesBox.delete(movieId);
    populateList();
  }
}

class WatchlistState {}

class WatchlistInitilal extends WatchlistState {}

class Watchlisted extends WatchlistState{}

class NotWatchlisted extends WatchlistState{}