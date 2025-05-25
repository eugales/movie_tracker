import 'package:flutter/material.dart';
import 'package:movie_tracker/application/injectable/injectable.dart';
import 'package:movie_tracker/application/remote_config/remote_config.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controler;

  @override
  void initState() {
    _controler =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0xFFFFFFFF));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = getIt<RemoteConfigViewModel>();
    final state = vm.state;

    return Scaffold(
      body: SafeArea(
        child: switch (state) {
          RemoteConfigInitial() => const Center(child: Text('Инициализация...')),
          RemoteConfigLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          RemoteConfigFailure(:final message) => Center(
            child: Text('Ошибка: $message'),
          ),
          RemoteConfigLoaded(:final config) => WebViewWidget(
            controller: _controler..loadRequest(Uri.parse(config.productionUrl)),
          ),
        },
      ),
    );
  }
}
