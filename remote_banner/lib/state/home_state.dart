import 'package:flutter/material.dart';
import 'package:remote_banner/features/firebase/remote_config_service.dart';

class HomeState extends ChangeNotifier {
  HomeState({Key? key, required this.service});
  final RemoteConfigService service;
  bool isLoading = false;
  Future<void> onInit() async {
    update(isLoading: true);
    await service.onInit();
    update();
  }

  void update({bool isLoading = false}) {
    isLoading = isLoading;
    notifyListeners();
  }

  bool get showMainBanner => service.showMainBanner;
  String get remoteAppTitle => service.remoteAppTitle;
}
