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

import '../../data/repos/home/ds/home_online_ds.dart' as _i5;
import '../../data/repos/home/home_repo.dart' as _i7;
import '../../ui/screens/home_view_model.dart' as _i9;
import '../repos/home/ds/home_online_ds.dart' as _i4;
import '../repos/home/home_repo.dart' as _i6;
import '../use_cases/get_data_use_case.dart' as _i8;
import 'app_module.dart' as _i10;

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
    gh.factory<_i4.HomeOnlineDs>(() => _i5.HomeOnlineDsImpl());
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i4.HomeOnlineDs>(),
        ));
    gh.factory<_i8.GetDataUseCase>(
        () => _i8.GetDataUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i9.HomeViewModel>(
        () => _i9.HomeViewModel(gh<_i8.GetDataUseCase>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
