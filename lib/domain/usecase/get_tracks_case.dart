import 'package:dartz/dartz.dart';
import 'package:music_app/common/failure.dart';
import 'package:music_app/domain/entity/tracks_entity.dart';
import 'package:music_app/domain/repository/data_repository.dart';

class GetTracksCase {
  DataRepository data;

  GetTracksCase(this.data);

  Future<Either<FailureCondition, List<TracksEntity>>> execute() {
    return data.getTracks();
  }
}
