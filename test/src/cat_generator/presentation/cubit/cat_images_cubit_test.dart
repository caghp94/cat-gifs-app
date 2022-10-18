import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:cats_gif_app/core/failures/general_failure.dart';
import 'package:cats_gif_app/src/cat_generator/domain/cats_repository.dart';
import 'package:cats_gif_app/src/cat_generator/presentation/cubit/cat_images_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatsRepository extends Mock implements CatsRepository {}

class MockGeneralFailure extends Fake implements GeneralFailure {
  @override
  String get errorMessage => 'Expected proper error message';
}

void main() {
  late MockCatsRepository mockRepository;
  late MockGeneralFailure mockGeneralFailure;
  late Uint8List mockImageBytes;

  setUpAll(() {
    mockRepository = MockCatsRepository();
    mockGeneralFailure = MockGeneralFailure();
    mockImageBytes = Uint8List.fromList([1, 2]);
  });

  group('CatImagesCubit', () {
    blocTest<CatImagesCubit, CatImagesState>(
      'When repository fails to retrieve an image, cubit should emit an error state with a proper message',
      setUp: () {
        when(() => mockRepository.getRandomCatImage()).thenAnswer(
          (_) async => Left(mockGeneralFailure),
        );
      },
      build: () => CatImagesCubit(repository: mockRepository),
      act: (bloc) => bloc.meow(),
      expect: () => [
        CatImagesLoading(),
        CatImagesError(errorMessage: mockGeneralFailure.errorMessage)
      ],
    );

    blocTest<CatImagesCubit, CatImagesState>(
        'When repository returns an image, cubit should emit loaded state with the image',
        setUp: () {
          when(() => mockRepository.getRandomCatImage()).thenAnswer(
            (_) async => Right(mockImageBytes),
          );
        },
        build: () => CatImagesCubit(repository: mockRepository),
        act: (bloc) => bloc.meow(),
        expect: () =>
            [CatImagesLoading(), CatImageLoaded(imageBytes: mockImageBytes)]);
  });
}
