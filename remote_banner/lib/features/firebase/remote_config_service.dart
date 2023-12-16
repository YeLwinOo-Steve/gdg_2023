import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

typedef DynamicMap = Map<String, dynamic>;

class RemoteConfigService {
  final FirebaseRemoteConfig? _remoteConfig;
  static RemoteConfigService? _instance;
  RemoteConfigService({required FirebaseRemoteConfig config})
      : _remoteConfig = config;
  static Future<RemoteConfigService> getInstance() async {
    _instance ??= RemoteConfigService(
      config: FirebaseRemoteConfig.instance,
    );
    return _instance!;
  }

  bool get showMainBanner => _remoteConfig!.getBool(_Keys.showMainBanner);
  String get remoteAppTitle => _remoteConfig!.getString(_Keys.remoteAppTitle);
  DynamicMap defaults = {
    _Keys.showMainBanner: false,
  };

  Future onInit() async {
    try {
      await _remoteConfig!.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(seconds: 0),
      ));
      await _remoteConfig!.setDefaults(defaults);
      await fetchAndActivate();
    } on FirebaseException catch (ex,stacktrace) {
      print("exception occurred $ex");
      print("stacktrace $stacktrace");
    }
  }

  Future fetchAndActivate() async {

    await _remoteConfig!.fetch();
    bool isActivated = await _remoteConfig!.fetchAndActivate();
  }
}

class _Keys {
  static String showMainBanner = "show_main_banner";
  static String remoteAppTitle = "app_title";
}
