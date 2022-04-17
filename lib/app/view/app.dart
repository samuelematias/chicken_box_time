import 'package:chicken_box_time/features/home/home.dart';
import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:chicken_box_time/l10n/l10n.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

/// The widget responsible for creating the [App].
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  App({
    Key? key,
  }) : super(key: key);

  /// Create the [App] routers.
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: 'Chicken Box Time',
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
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
