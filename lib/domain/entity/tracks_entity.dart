import 'package:equatable/equatable.dart';

class TracksEntity extends Equatable {
  final int discNumber;
  final int durationMs;
  final bool explicit;
  final String id;
  final bool isLocal;
  final bool isPlayable;
  final String name;
  final int popularity;
  final String previewUrl;
  final int trackNumber;
  final String type;
  final String uri;

  const TracksEntity({
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.id,
    required this.isLocal,
    required this.isPlayable,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  @override
  List<Object?> get props => [
        discNumber,
        durationMs,
        explicit,
        id,
        isLocal,
        isPlayable,
        name,
        popularity,
        previewUrl,
        trackNumber,
        type,
        uri,
      ];
}
