import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_tracker/application/remote_config/remote_config.dart';

@singleton
class RemoteConfigViewModel extends ChangeNotifier {
  final RemoteConfigService service;

  RemoteConfigViewModel(this.service);

  RemoteConfigState _state = const RemoteConfigInitial();
  RemoteConfigState get state => _state;

  Future<void> load() async {
    _state = const RemoteConfigLoading();
    notifyListeners();

    try {
      final config = await service.load();
      _state = RemoteConfigLoaded(config);
    } catch (e) {
      _state = RemoteConfigFailure(e.toString());
    }

    notifyListeners();
  }
}