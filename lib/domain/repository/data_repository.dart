import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:music_app/common/exception.dart';
import 'package:music_app/common/failure.dart';
import 'package:music_app/data/sources/remote_datasource.dart';
import 'package:music_app/domain/entity/tracks_entity.dart';

abstract class DataRepository {
  Future<Either<FailureCondition, List<TracksEntity>>> getTracks();
}

class DataRepositoryImpl implements DataRepository {
  final RemoteDatasource data;

  DataRepositoryImpl({required this.data});

  @override
  Future<Either<FailureCondition, List<TracksEntity>>> getTracks() async {
    try {
      final result = await data.getTracks();
      return Right(result.map((e) => e.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('No Internet Connection'));
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on TlsException {
      return const Left(SslFailure('SSL Error'));
    }
  }
}
