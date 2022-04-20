import 'package:chicken_box_time/features/home/home.dart';
import 'package:chicken_box_time/features/movie/movie.dart';
import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:chicken_box_time/l10n/l10n.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_repository/movie_repository.dart';

/// The widget responsible for creating the [App].
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  App({
    Key? key,
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(key: key);

  final MovieRepository _movieRepository;

  /// Create the [App] routers.
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
      GoRoute(
        path: MovieListPage.route,
        builder: (context, state) => const MovieListPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _movieRepository,
      child: _AppView(router: _router),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({
    Key? key,
    required this.router,
  }) : super(key: key);

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: 'Chicken Box Time',
      appLogo: ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        '',
      ),
      darkAppLogo: ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        '',
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        return FlavorBanner(child: child);
      },
    );
  }
}
