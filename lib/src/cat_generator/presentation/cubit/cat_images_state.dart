part of 'cat_images_cubit.dart';

@immutable
abstract class CatImagesState {}

class CatImagesInitial extends CatImagesState {}

class CatImagesLoading extends CatImagesState{}

class CatImagesError extends CatImagesState {
  final String errorMessage;

  CatImagesError({required this.errorMessage});
}

class CatImageLoaded extends CatImagesState {
  final Uint8List imageBytes;

  CatImageLoaded({required this.imageBytes});
}
