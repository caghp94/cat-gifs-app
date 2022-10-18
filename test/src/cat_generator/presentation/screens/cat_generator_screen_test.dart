import 'package:bloc_test/bloc_test.dart';
import 'package:cats_gif_app/src/cat_generator/presentation/cubit/cat_images_cubit.dart';
import 'package:cats_gif_app/src/cat_generator/presentation/screens/cat_generator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatImagesCubit extends MockCubit<CatImagesState>
    implements CatImagesCubit {}

class FakeCatImagesState extends Fake implements CatImagesState {}

class FakeCatImagesLoadingState extends Fake implements CatImagesLoading {}

class FakeCatImagesInitialState extends Fake implements CatImagesInitial {}

void main() {
  late MockCatImagesCubit mockCatsImageCubit;
  FakeCatImagesLoadingState loadingState = FakeCatImagesLoadingState();
  registerFallbackValue(FakeCatImagesState());
  registerFallbackValue(FakeCatImagesInitialState());

  setUpAll(() {
    mockCatsImageCubit = MockCatImagesCubit();
  });

  Widget createWidget() {
    return MaterialApp(
      title: 'Cat GIFs',
      home: CatGeneratorScreen(testCubit: mockCatsImageCubit),
    );
  }

  group('Cat generator screen', () {
    testWidgets(
        'When loading status is emitted, show a circular progress view',
        (WidgetTester tester) async {
      when(() => mockCatsImageCubit.state).thenReturn(CatImagesLoading());

      await tester.pumpWidget(createWidget());
      expect(find.byKey(const Key('cat-images-loading')), findsOneWidget);
    });
  });
}
