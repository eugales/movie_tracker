enum AppMode { review, production }

class RemoteConfigModel {
  final AppMode mode;
  final String productionUrl;

  const RemoteConfigModel({
    required this.mode,
    required this.productionUrl,
  });

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) {
    return RemoteConfigModel(
      mode: json['mode'] == 'production' ? AppMode.production : AppMode.review,
      productionUrl: json['production_url'] ?? '',
    );
  }
}
