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

import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i5;
import '../../data/repos/home_repo/home_repo.dart' as _i7;
import '../../data/repos/search_repo/ds/search_online_ds.dart' as _i9;
import '../../data/repos/search_repo/search_repo.dart' as _i11;
import '../../ui/screens/main/main_view_model.dart' as _i17;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i16;
import '../../ui/screens/main/tabs/search/search_view_model.dart' as _i18;
import '../repos/home_repo/ds/home_online_ds.dart' as _i4;
import '../repos/home_repo/home_repo.dart' as _i6;
import '../repos/search_repo/ds/search_online_ds.dart' as _i8;
import '../repos/search_repo/search_repo.dart' as _i10;
import '../use_case/home_use_cases/get_popular_use_case.dart' as _i13;
import '../use_case/home_use_cases/get_recommended_use_case.dart' as _i14;
import '../use_case/home_use_cases/get_release_use_case.dart' as _i15;
import '../use_case/search_use_cases/get_list_of_searching.dart' as _i12;
import 'app_module.dart' as _i19;

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
    gh.factory<_i4.HomeOnlineDS>(() => _i5.HomeOnlineDSImpl());
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i4.HomeOnlineDS>(),
        ));
    gh.factory<_i8.SearchOnlineDS>(() => _i9.SearchOnlineDSImpl());
    gh.factory<_i10.SearchRepo>(() => _i11.SearchRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i8.SearchOnlineDS>(),
        ));
    gh.factory<_i12.getListOfSearchingUseCase>(
        () => _i12.getListOfSearchingUseCase(gh<_i10.SearchRepo>()));
    gh.factory<_i13.GetPopularUseCase>(
        () => _i13.GetPopularUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i14.GetRecommendedUseCase>(
        () => _i14.GetRecommendedUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i15.GetReleasesUseCase>(
        () => _i15.GetReleasesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i16.HomeViewModel>(() => _i16.HomeViewModel(
          gh<_i13.GetPopularUseCase>(),
          gh<_i15.GetReleasesUseCase>(),
          gh<_i14.GetRecommendedUseCase>(),
        ));
    gh.factory<_i17.MainViewModel>(() => _i17.MainViewModel(
          gh<_i13.GetPopularUseCase>(),
          gh<_i14.GetRecommendedUseCase>(),
          gh<_i15.GetReleasesUseCase>(),
        ));
    gh.factory<_i18.SearchViewModel>(
        () => _i18.SearchViewModel(gh<_i12.getListOfSearchingUseCase>()));
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
