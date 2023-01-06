import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stan_handel_web/core/di_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
)
void configureDependencies() => getIt.init();

