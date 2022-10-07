import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/data/sources/remote_datasource.dart';
import 'package:music_app/domain/repository/data_repository.dart';
import 'package:music_app/domain/usecase/get_tracks_case.dart';
import 'package:music_app/presentation/bloc/track/track_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => TrackBloc(locator()));

  locator.registerFactory(() => GetTracksCase(locator()));

  locator.registerLazySingleton<DataRepository>(
      () => DataRepositoryImpl(data: locator()));

  locator.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl());

  locator.registerLazySingleton(() => http.Client());
}
