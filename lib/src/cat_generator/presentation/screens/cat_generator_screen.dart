import 'package:cats_gif_app/dependency_injector.dart';
import 'package:cats_gif_app/src/cat_generator/presentation/cubit/cat_images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';

class CatGeneratorScreen extends StatefulWidget {
  const CatGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<CatGeneratorScreen> createState() => _CatGeneratorScreenState();
}

class _CatGeneratorScreenState extends State<CatGeneratorScreen> {
  final CatImagesCubit _cubit = getIt<CatImagesCubit>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat GIFs'),
      ),
      backgroundColor: Colors.lightBlue.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Meow for more cat GIFs!',
                      style: textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: BlocBuilder<CatImagesCubit, CatImagesState>(
                        bloc: _cubit,
                        builder: (context, state) {
                          if (state is CatImageLoaded) {
                            return Image.memory(
                              state.imageBytes,
                              height: size.width * .7,
                            );
                          } else if (state is CatImagesLoading) {
                            return SizedBox(
                              height: size.width * .7,
                              child: const Center(child: CircularProgressIndicator()),
                            );
                          } else if (state is CatImagesError) {
                            return SizedBox(
                              height: size.width * .7,
                              child: Center(
                                child: Text(
                                  state.errorMessage,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _cubit.meow,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(
                              'assets/images/cat.svg',
                              width: 20,
                              color: Colors.white,
                            ),
                          ),
                          const Text('Meow'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text('Made with ❤️ for Azumo recruiters')
          ],
        ),
      ),
    );
  }
}
