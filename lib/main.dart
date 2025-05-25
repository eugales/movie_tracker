import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_tracker/application/injectable/injectable.dart';
import 'package:movie_tracker/application/router.dart';
import 'package:movie_tracker/application/theme/theme_service.dart';
import 'package:movie_tracker/application/theme/theme_state.dart';
import 'package:movie_tracker/application/theme/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseDatabase.instance.setPersistenceEnabled(false);
  await configureDependencies();
  runApp(const Providers());
}

class Providers extends StatelessWidget {
  const Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeViewModel(getIt<ThemeService>())..load(),
      builder: (context, child) => MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ThemeViewModel>();
    final state = vm.state;

    final themeMode = switch (state) {
      ThemeLoaded(:final mode) => mode,
      _ => ThemeMode.system,
    };

    return MaterialApp.router(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
