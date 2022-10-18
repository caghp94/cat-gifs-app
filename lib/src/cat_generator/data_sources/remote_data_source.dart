import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<Uint8List> getRandomCatImage();
}

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource{
  @override
  Future<Uint8List> getRandomCatImage() async {
    const catsApi = 'https://cataas.com/cat/gif';
    
    final imageBytes = (await NetworkAssetBundle(Uri.parse(catsApi))
      .load(catsApi))
      .buffer
      .asUint8List();
    
    return imageBytes;
  }

}