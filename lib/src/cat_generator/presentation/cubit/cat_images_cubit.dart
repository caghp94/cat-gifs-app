import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cats_gif_app/core/failures/general_failure.dart';
import 'package:cats_gif_app/src/cat_generator/domain/cats_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cat_images_state.dart';

@injectable
class CatImagesCubit extends Cubit<CatImagesState> {
  CatsRepository repository;

  CatImagesCubit({required this.repository}) : super(CatImagesInitial());

  void meow() async {
    emit(CatImagesLoading());
    var result = await repository.getRandomCatImage();

    emit(
      result.fold(
        (l) => CatImagesError(errorMessage: l.errorMessage),
        (r) => CatImageLoaded(imageBytes: r),
      ),
    );
  }
}
