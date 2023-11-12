import 'package:get_it/get_it.dart';
import 'package:remote_banner/state/home_state.dart';

import '../firebase/remote_config_service.dart';

final locator = GetIt.I;

class Injection {
  static Future setup() async {
    final configInstance = await RemoteConfigService.getInstance();
    locator.registerLazySingleton(
      () => configInstance,
    );
    locator.registerLazySingleton(() => HomeState(service: locator.get()));
  }
}
