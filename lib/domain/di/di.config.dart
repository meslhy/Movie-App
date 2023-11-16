// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/details_repo/details_repo.dart' as _i7;
import '../../data/repos/details_repo/ds/details_online_ds.dart' as _i5;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i10;
import '../../data/repos/home_repo/home_repo.dart' as _i12;
import '../../data/repos/search_repo/ds/search_online_ds.dart' as _i14;
import '../../data/repos/search_repo/search_repo.dart' as _i16;
import '../../ui/screens/film_details/film_details_view_model.dart' as _i19;
import '../../ui/screens/main/main_view_model.dart' as _i24;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i23;
import '../../ui/screens/main/tabs/search/search_view_model.dart' as _i25;
import '../repos/details_repo/details_repo.dart' as _i6;
import '../repos/details_repo/ds/details_online_ds.dart' as _i4;
import '../repos/home_repo/ds/home_online_ds.dart' as _i9;
import '../repos/home_repo/home_repo.dart' as _i11;
import '../repos/search_repo/ds/search_online_ds.dart' as _i13;
import '../repos/search_repo/search_repo.dart' as _i15;
import '../use_case/details_use_cases/get_details_use_case.dart' as _i8;
import '../use_case/details_use_cases/get_similar_movies.dart' as _i17;
import '../use_case/home_use_cases/get_popular_use_case.dart' as _i20;
import '../use_case/home_use_cases/get_recommended_use_case.dart' as _i21;
import '../use_case/home_use_cases/get_release_use_case.dart' as _i22;
import '../use_case/search_use_cases/get_list_of_searching.dart' as _i18;
import 'app_module.dart' as _i26;

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
    gh.factory<_i3.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i4.DetailsOnlineDS>(() => _i5.DetailsOnlineDSImpl());
    gh.factory<_i6.DetailsRepo>(() => _i7.DetailsRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i4.DetailsOnlineDS>(),
        ));
    gh.factory<_i8.DetailsUseCase>(
        () => _i8.DetailsUseCase(gh<_i6.DetailsRepo>()));
    gh.factory<_i9.HomeOnlineDS>(() => _i10.HomeOnlineDSImpl());
    gh.factory<_i11.HomeRepo>(() => _i12.HomeRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i9.HomeOnlineDS>(),
        ));
    gh.factory<_i13.SearchOnlineDS>(() => _i14.SearchOnlineDSImpl());
    gh.factory<_i15.SearchRepo>(() => _i16.SearchRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i13.SearchOnlineDS>(),
        ));
    gh.factory<_i17.SimilarMoviesUseCase>(
        () => _i17.SimilarMoviesUseCase(gh<_i6.DetailsRepo>()));
    gh.factory<_i18.getListOfSearchingUseCase>(
        () => _i18.getListOfSearchingUseCase(gh<_i15.SearchRepo>()));
    gh.factory<_i19.FilmDetailsViewModel>(() => _i19.FilmDetailsViewModel(
          gh<_i8.DetailsUseCase>(),
          gh<_i17.SimilarMoviesUseCase>(),
        ));
    gh.factory<_i20.GetPopularUseCase>(
        () => _i20.GetPopularUseCase(gh<_i11.HomeRepo>()));
    gh.factory<_i21.GetRecommendedUseCase>(
        () => _i21.GetRecommendedUseCase(gh<_i11.HomeRepo>()));
    gh.factory<_i22.GetReleasesUseCase>(
        () => _i22.GetReleasesUseCase(gh<_i11.HomeRepo>()));
    gh.factory<_i23.HomeViewModel>(() => _i23.HomeViewModel(
          gh<_i20.GetPopularUseCase>(),
          gh<_i22.GetReleasesUseCase>(),
          gh<_i21.GetRecommendedUseCase>(),
        ));
    gh.factory<_i24.MainViewModel>(() => _i24.MainViewModel(
          gh<_i20.GetPopularUseCase>(),
          gh<_i21.GetRecommendedUseCase>(),
          gh<_i22.GetReleasesUseCase>(),
        ));
    gh.factory<_i25.SearchViewModel>(
        () => _i25.SearchViewModel(gh<_i18.getListOfSearchingUseCase>()));
    return this;
  }
}

class _$AppModule extends _i26.AppModule {}
