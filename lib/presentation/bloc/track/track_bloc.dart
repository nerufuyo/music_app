import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/common/failure.dart';
import 'package:music_app/domain/entity/tracks_entity.dart';
import 'package:music_app/domain/usecase/get_tracks_case.dart';

part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  final GetTracksCase getTracksCase;
  TrackBloc(this.getTracksCase) : super(TrackInitial()) {
    on<TrackEvent>((event, emit) async {
      emit(TrackLoading());

      final Either<FailureCondition, List<TracksEntity>> eitherResponse =
          await getTracksCase.execute();

      eitherResponse.fold(
        (FailureCondition failure) => emit(TrackError(failure.message)),
        (List<TracksEntity> tracks) => emit(TrackLoaded(tracks)),
      );
    });
  }
}
