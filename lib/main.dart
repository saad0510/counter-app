import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'logic/cubit/counter_cubit.dart';
import 'logic/cubit/theme_cubit.dart';
import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'presentation/router/app_router.dart';

void main() async {
  // BlocObserver blocObserver = AppBlocObserver();

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final directory = await path.getApplicationDocumentsDirectory();
  final storage = await HydratedStorage.build(storageDirectory: directory);

  FlutterNativeSplash.remove();

  HydratedBlocOverrides.runZoned(
    storage: storage,
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ThemeCubit()),
            BlocProvider(create: (context) => CounterCubit()),
          ],
          child: const App(),
        ),
      );
    },
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateTheme();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select((ThemeCubit x) => x.state.themeMode);

    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.counter,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
