// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/cat_generator/data_sources/remote_data_source.dart' as _i3;
import 'src/cat_generator/domain/cats_repository.dart' as _i4;
import 'src/cat_generator/presentation/cubit/cat_images_cubit.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.RemoteDataSource>(() => _i3.RemoteDataSourceImpl());
  gh.factory<_i4.CatsRepository>(() =>
      _i4.CatsRepositoryImpl(remoteDataSource: get<_i3.RemoteDataSource>()));
  gh.factory<_i5.CatImagesCubit>(
      () => _i5.CatImagesCubit(repository: get<_i4.CatsRepository>()));
  return get;
}
