import 'dart:typed_data';

import 'package:cats_gif_app/core/failures/general_failure.dart';
import 'package:cats_gif_app/src/cat_generator/data_sources/remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CatsRepository {
  Future<Either<GeneralFailure, Uint8List>> getRandomCatImage();
}

@Injectable(as: CatsRepository)
class CatsRepositoryImpl implements CatsRepository {
  RemoteDataSource remoteDataSource;

  CatsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<GeneralFailure, Uint8List>> getRandomCatImage() async {
    try {
      final newCatImage = await remoteDataSource.getRandomCatImage();

      return Right(newCatImage);
    } on Exception catch (_) {
      return Left(GeneralFailure(
          errorMessage: 'Something went wrong retrieving your cat GIF'));
    }
  }
}
