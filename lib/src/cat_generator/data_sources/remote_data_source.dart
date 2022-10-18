import 'dart:typed_data';

import 'package:cats_gif_app/core/failures/general_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<Uint8List> getRandomCatImage();
}

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource{
  @override
  Future<Uint8List> getRandomCatImage() {
    // TODO: implement getRandomCatImage
    throw UnimplementedError();
  }

}