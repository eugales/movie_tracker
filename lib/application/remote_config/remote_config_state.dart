import 'remote_config_model.dart';

sealed class RemoteConfigState {
  const RemoteConfigState();
}

class RemoteConfigInitial extends RemoteConfigState {
  const RemoteConfigInitial();
}

class RemoteConfigLoading extends RemoteConfigState {
  const RemoteConfigLoading();
}

class RemoteConfigLoaded extends RemoteConfigState {
  final RemoteConfigModel config;
  const RemoteConfigLoaded(this.config);
}

class RemoteConfigFailure extends RemoteConfigState {
  final String message;
  const RemoteConfigFailure(this.message);
}



