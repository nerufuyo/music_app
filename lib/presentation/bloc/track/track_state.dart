part of 'track_bloc.dart';

abstract class TrackState extends Equatable {
  const TrackState();

  @override
  List<Object> get props => [];
}

class TrackInitial extends TrackState {}

class TrackLoading extends TrackState {}

class TrackLoaded extends TrackState {
  final List<TracksEntity> track;

  const TrackLoaded(this.track);

  @override
  List<Object> get props => [track];
}

class TrackError extends TrackState {
  final String message;

  const TrackError(this.message);

  @override
  List<Object> get props => [message];
}
