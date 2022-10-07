import 'package:equatable/equatable.dart';
import 'package:music_app/domain/entity/tracks_entity.dart';

class TracksModel extends Equatable {
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

  const TracksModel({
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

  factory TracksModel.fromJson(Map<String, dynamic> json) => TracksModel(
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "id": id,
        "is_local": isLocal,
        "is_playable": isPlayable,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
      };

  TracksEntity toEntity() => TracksEntity(
        discNumber: discNumber,
        durationMs: durationMs,
        explicit: explicit,
        id: id,
        isLocal: isLocal,
        isPlayable: isPlayable,
        name: name,
        popularity: popularity,
        previewUrl: previewUrl,
        trackNumber: trackNumber,
        type: type,
        uri: uri,
      );

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
