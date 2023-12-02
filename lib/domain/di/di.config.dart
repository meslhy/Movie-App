// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/category_repo/category_repo.dart' as _i30;
import '../../data/repos/category_repo/ds/category_name_ds.dart' as _i4;
import '../../data/repos/details_repo/details_repo.dart' as _i9;
import '../../data/repos/details_repo/ds/details_online_ds.dart' as _i7;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i12;
import '../../data/repos/home_repo/home_repo.dart' as _i14;
import '../../data/repos/movies_of_category_repo/ds/movies_of_category_online_ds.dart'
    as _i16;
import '../../data/repos/movies_of_category_repo/movies_of_category_repo.dart'
    as _i18;
import '../../data/repos/search_repo/ds/search_online_ds.dart' as _i22;
import '../../data/repos/search_repo/search_repo.dart' as _i24;
import '../../data/repos/watched_repo/ds/watched_offline_ds.dart' as _i27;
import '../../data/repos/watched_repo/watched_repo.dart' as _i38;
import '../../ui/screens/film_details/film_details_view_model.dart' as _i31;
import '../../ui/screens/main/main_view_model.dart' as _i36;
import '../../ui/screens/main/tabs/browes/browse_view_model.dart' as _i44;
import '../../ui/screens/main/tabs/browes/movies_of_category/movies_of_category_view_model.dart'
    as _i20;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i35;
import '../../ui/screens/main/tabs/search/search_view_model.dart' as _i40;
import '../repos/category_repo/category_repo.dart' as _i29;
import '../repos/category_repo/ds/category_name_ds.dart' as _i3;
import '../repos/details_repo/details_repo.dart' as _i8;
import '../repos/details_repo/ds/details_online_ds.dart' as _i6;
import '../repos/home_repo/ds/home_online_ds.dart' as _i11;
import '../repos/home_repo/home_repo.dart' as _i13;
import '../repos/movies_of_category_repo/ds/movies_of_category_online_ds.dart'
    as _i15;
import '../repos/movies_of_category_repo/movies_of_category_repo.dart' as _i17;
import '../repos/search_repo/ds/search_online_ds.dart' as _i21;
import '../repos/search_repo/search_repo.dart' as _i23;
import '../repos/watched_repo/ds/watched_offline_ds.dart' as _i26;
import '../repos/watched_repo/watched_repo.dart' as _i37;
import '../use_case/brose_use_cases/get_categories_name_use_case.dart' as _i41;
import '../use_case/details_use_cases/get_details_use_case.dart' as _i10;
import '../use_case/details_use_cases/get_similar_movies.dart' as _i25;
import '../use_case/home_use_cases/get_popular_use_case.dart' as _i32;
import '../use_case/home_use_cases/get_recommended_use_case.dart' as _i33;
import '../use_case/home_use_cases/get_release_use_case.dart' as _i34;
import '../use_case/movies_of_category_use_case/movies_of_category_use_case.dart'
    as _i19;
import '../use_case/search_use_cases/get_list_of_searching.dart' as _i28;
import '../use_case/watched_use_case/delete_watched_use_case.dart' as _i42;
import '../use_case/watched_use_case/get_watched_use_case.dart' as _i43;
import '../use_case/watched_use_case/save_watched_use_case.dart' as _i39;
import 'app_module.dart' as _i45;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.CategoriesOnlineDS>(() => _i4.CategoriesOnlineDSImpl());
    gh.factory<_i5.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i6.DetailsOnlineDS>(() => _i7.DetailsOnlineDSImpl());
    gh.factory<_i8.DetailsRepo>(() => _i9.DetailsRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i6.DetailsOnlineDS>(),
        ));
    gh.factory<_i10.DetailsUseCase>(
        () => _i10.DetailsUseCase(gh<_i8.DetailsRepo>()));
    gh.factory<_i11.HomeOnlineDS>(() => _i12.HomeOnlineDSImpl());
    gh.factory<_i13.HomeRepo>(() => _i14.HomeRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i11.HomeOnlineDS>(),
        ));
    gh.factory<_i15.MoviesOfCategoryOnlineDS>(
        () => _i16.MoviesOfCategoryOnlineDSImpl());
    gh.factory<_i17.MoviesOfCategoryRepo>(() => _i18.MoviesOfCategoryRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i15.MoviesOfCategoryOnlineDS>(),
        ));
    gh.factory<_i19.MoviesOfCategoryUseCase>(
        () => _i19.MoviesOfCategoryUseCase(gh<_i17.MoviesOfCategoryRepo>()));
    gh.factory<_i20.MoviesOfCategoryViewModel>(() =>
        _i20.MoviesOfCategoryViewModel(gh<_i19.MoviesOfCategoryUseCase>()));
    gh.factory<_i21.SearchOnlineDS>(() => _i22.SearchOnlineDSImpl());
    gh.factory<_i23.SearchRepo>(() => _i24.SearchRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i21.SearchOnlineDS>(),
        ));
    gh.factory<_i25.SimilarMoviesUseCase>(
        () => _i25.SimilarMoviesUseCase(gh<_i8.DetailsRepo>()));
    gh.factory<_i26.WatchedOfflineDS>(() => _i27.WatchedOfflineDSImpl());
    gh.factory<_i28.getListOfSearchingUseCase>(
        () => _i28.getListOfSearchingUseCase(gh<_i23.SearchRepo>()));
    gh.factory<_i29.CategoryRepo>(() => _i30.CategoryRepoImpl(
          gh<_i5.Connectivity>(),
          gh<_i3.CategoriesOnlineDS>(),
        ));
    gh.factory<_i31.FilmDetailsViewModel>(() => _i31.FilmDetailsViewModel(
          gh<_i10.DetailsUseCase>(),
          gh<_i25.SimilarMoviesUseCase>(),
        ));
    gh.factory<_i32.GetPopularUseCase>(
        () => _i32.GetPopularUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i33.GetRecommendedUseCase>(
        () => _i33.GetRecommendedUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i34.GetReleasesUseCase>(
        () => _i34.GetReleasesUseCase(gh<_i13.HomeRepo>()));
    gh.factory<_i35.HomeViewModel>(() => _i35.HomeViewModel(
          gh<_i32.GetPopularUseCase>(),
          gh<_i34.GetReleasesUseCase>(),
          gh<_i33.GetRecommendedUseCase>(),
        ));
    gh.factory<_i36.MainViewModel>(() => _i36.MainViewModel(
          gh<_i32.GetPopularUseCase>(),
          gh<_i33.GetRecommendedUseCase>(),
          gh<_i34.GetReleasesUseCase>(),
        ));
    gh.factory<_i37.MoviesWatchedRepo>(() => _i38.MoviesWatchedRepoImpl(
          gh<_i26.WatchedOfflineDS>(),
          gh<_i5.Connectivity>(),
        ));
    gh.factory<_i39.SaveMoviesWatchedUseCase>(
        () => _i39.SaveMoviesWatchedUseCase(gh<_i37.MoviesWatchedRepo>()));
    gh.factory<_i40.SearchViewModel>(
        () => _i40.SearchViewModel(gh<_i28.getListOfSearchingUseCase>()));
    gh.factory<_i41.CategoriesNameUseCase>(
        () => _i41.CategoriesNameUseCase(gh<_i29.CategoryRepo>()));
    gh.factory<_i42.DeleteMoviesWatchedUseCase>(
        () => _i42.DeleteMoviesWatchedUseCase(gh<_i37.MoviesWatchedRepo>()));
    gh.factory<_i43.GetMoviesWatchedUseCase>(
        () => _i43.GetMoviesWatchedUseCase(gh<_i37.MoviesWatchedRepo>()));
    gh.factory<_i44.BrowseViewModel>(
        () => _i44.BrowseViewModel(gh<_i41.CategoriesNameUseCase>()));
    return this;
  }
}

class _$AppModule extends _i45.AppModule {}
