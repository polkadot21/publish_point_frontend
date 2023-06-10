import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:publishpoint/src/bloc/home_bloc/home_bloc.dart';
import 'package:publishpoint/src/constants/app_color.dart';
import 'package:publishpoint/src/repository/home_repository.dart';
import 'package:publishpoint/src/ui/main_screen.dart';
import 'package:publishpoint/src/ui/privacy_screen/privacy_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
  setUrlStrategy(PathUrlStrategy());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Publish Point',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: AppColor.fontFamily,
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          return buildPage(
            settings.name ?? '',
            settings.arguments,
          );
        });
      },
    );
  }

  Widget buildPage(String name, Object? arguments) {
    Map<String, dynamic>? args;
    if (arguments != null) {
      args = arguments as Map<String, dynamic>;
    }
    switch (name) {
      case '/':
        return RepositoryProvider(
          create: (context) => HomeRepository(),
          child: BlocProvider(
            create: (context) => HomeBloc(
              repository: HomeRepository(),
            ),
            child: MainScreen(
              index: args == null ? 0 : args["index"] ?? 0,
            ),
          ),
        );
      case '/privacy':
        return const PrivacyScreen();
      default:
        return const MainScreen();
    }
  }
}

class Routes {
  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }
}
