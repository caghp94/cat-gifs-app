import 'package:cats_gif_app/dependency_injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
void configureDependencies() => $initGetIt(getIt);