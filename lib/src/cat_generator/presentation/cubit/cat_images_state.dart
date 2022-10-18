part of 'cat_images_cubit.dart';

@immutable
abstract class CatImagesState extends Equatable {}

class CatImagesInitial extends CatImagesState {
  @override
  List<Object?> get props => [];
}

class CatImagesLoading extends CatImagesState {
  @override
  List<Object?> get props => [];
}

class CatImagesError extends CatImagesState {
  final String errorMessage;

  CatImagesError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class CatImageLoaded extends CatImagesState {
  final Uint8List imageBytes;

  CatImageLoaded({required this.imageBytes});

  @override
  List<Object?> get props => [imageBytes];
}
