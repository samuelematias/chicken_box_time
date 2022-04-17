import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Class responsible to [AppBase].
class AppBase extends StatelessWidget {
  /// Creates a new instance of [AppBase].
  const AppBase({
    Key? key,
    required this.routerDelegate,
    required this.routeInformationParser,
    this.routeInformationProvider,
    this.backButtonDispatcher,
    this.debugShowGrid = false,
    this.title = '',
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.useInheritedMediaQuery = false,
    this.debugShowCheckedModeBanner = true,
    this.showSemanticsDebugger = false,
    this.checkerboardOffscreenLayers = false,
    this.checkerboardRasterCacheImages = false,
    this.showPerformanceOverlay = false,
    this.onGenerateTitle,
    this.shortcuts,
    this.actions,
    this.builder,
    this.locale,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.localizationsDelegates,
    this.restorationScopeId,
  }) : super(key: key);

  /// Receive the LocalizationsDelegate,
  /// responsible App/Global localizations.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// Check if [useInheritedMediaQuery] or not.
  final bool useInheritedMediaQuery;

  /// Check if [debugShowGrid] or not.
  final bool debugShowGrid;

  /// Check if [debugShowCheckedModeBanner] or not.
  final bool debugShowCheckedModeBanner;

  /// Receive the information about the routes.
  final RouteInformationProvider? routeInformationProvider;

  /// Receive the information about the routes and parser it.
  final RouteInformationParser<Object> routeInformationParser;

  /// The [Shortcuts] widget, which defines a keyboard mapping.
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// Receive the supportedLocales,
  /// about the l10n, i18n.
  final List<Locale> supportedLocales;

  /// Receive the App [title].
  final String title;

  /// If non-null this callback function is called to produce the app's
  /// title string, otherwise [title] is used.
  final String Function(BuildContext)? onGenerateTitle;

  /// Report to a [Router] when the user taps the back button on platforms that
  /// support back buttons (such as Android).
  final BackButtonDispatcher? backButtonDispatcher;

  /// Receive a Object of [RouterDelegate].
  final RouterDelegate<Object> routerDelegate;

  /// The [Actions] widget, which defines the mapping from intent to action.
  final Map<Type, Action<Intent>>? actions;

  /// Providing a restoration ID inserts a [RootRestorationScope] into the
  /// widget hierarchy, which enables state restoration for descendant widgets.
  final String? restorationScopeId;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  final bool showSemanticsDebugger;

  /// Checkerboards layers rendered to offscreen bitmaps.
  ///
  /// See [PerformanceOverlay.checkerboardOffscreenLayers].
  final bool checkerboardOffscreenLayers;

  /// Checkerboards raster cache images.
  ///
  /// See [PerformanceOverlay.checkerboardRasterCacheImages].
  final bool checkerboardRasterCacheImages;

  /// This callback considers only the default locale, which is the first locale
  /// in the preferred locales list.
  /// It is preferred to set [localeListResolutionCallback]
  /// over [localeResolutionCallback] as it provides
  /// the full preferred locales list.
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;

  /// When a [localeListResolutionCallback] is provided, Flutter will first
  /// attempt to resolve the locale with the provided
  /// [localeListResolutionCallback]. If the callback or result is null, it will
  /// fallback to trying the [localeResolutionCallback]. If both
  /// [localeResolutionCallback] and [localeListResolutionCallback] are left
  /// null or fail to resolve (return null), basic fallback algorithm will
  /// be used.
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
      localeListResolutionCallback;

  ///Check if [showPerformanceOverlay] or not.
  final bool showPerformanceOverlay;

  /// An identifier used to select a user's language and formatting preferences.
  final Locale? locale;

  /// A builder that builds a widget given a child.
  ///
  /// The child should typically be part of the returned widget tree.
  ///
  /// Used by [AnimatedBuilder.builder], as well as [WidgetsApp.builder] and
  /// MaterialApp.builder.
  final TransitionBuilder? builder;

  // We provide material and cupertino localization delegate even it will
  // probably not be used.
  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates sync* {
    if (localizationsDelegates != null) yield* localizationsDelegates!;
    yield material.DefaultMaterialLocalizations.delegate;
    yield cupertino.DefaultCupertinoLocalizations.delegate;
  }

  /// Method to handle/controlle the [HeroController].
  static HeroController createAppHeroController() {
    return HeroController(
      createRectTween: (Rect? begin, Rect? end) {
        return material.MaterialRectArcTween(begin: begin, end: end);
      },
    );
  }

  Widget _inspectorSelectButtonBuilder(
    BuildContext context,
    VoidCallback onPressed,
  ) {
    return material.ElevatedButton(
      onPressed: onPressed,
      child: const SizedBox.expand(),
    );
  }

  Widget _appBuilder(BuildContext context, Widget? child) {
    return builder != null
        ? builder!(context, child)
        : child ?? const SizedBox.shrink();
  }

  Widget _buildWidgetApp(BuildContext context) {
    Widget result = AppResponsiveTheme(
      child: cupertino.Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return WidgetsApp.router(
            key: GlobalObjectKey(this),
            routeInformationProvider: routeInformationProvider,
            routeInformationParser: routeInformationParser,
            routerDelegate: routerDelegate,
            backButtonDispatcher: backButtonDispatcher,
            builder: _appBuilder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            textStyle: theme.typography.labelSmall.copyWith(
              color: theme.colors.font,
            ),
            color: theme.colors.brand,
            locale: locale,
            localizationsDelegates: _localizationsDelegates,
            localeResolutionCallback: localeResolutionCallback,
            localeListResolutionCallback: localeListResolutionCallback,
            supportedLocales: supportedLocales,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            inspectorSelectButtonBuilder: _inspectorSelectButtonBuilder,
            shortcuts: shortcuts,
            actions: actions,
            restorationScopeId: restorationScopeId,
            useInheritedMediaQuery: useInheritedMediaQuery,
          );
        },
      ),
    );

    if (!useInheritedMediaQuery) {
      result = MediaQuery.fromWindow(
        child: result,
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    var result = _buildWidgetApp(context);
    result = Focus(
      canRequestFocus: false,
      onKey: (FocusNode node, RawKeyEvent event) {
        if (event is! RawKeyDownEvent ||
            event.logicalKey != LogicalKeyboardKey.escape) {
          return KeyEventResult.ignored;
        }
        return KeyEventResult.ignored;
      },
      child: result,
    );
    assert(
      () {
        if (debugShowGrid) {
          result = GridPaper(
            color: const Color(0xE0F9BBE0),
            interval: 8,
            subdivisions: 1,
            child: result,
          );
        }
        return true;
      }(),
      'Problem on debugShowGrid. Please check '
      'the assert inside the method build of the AppBase widget.',
    );

    return ScrollConfiguration(
      behavior: const _ScrollBehaviour(),
      child: HeroControllerScope(
        controller: createAppHeroController(),
        child: result,
      ),
    );
  }
}

class _ScrollBehaviour extends ScrollBehavior {
  /// Creates a MaterialScrollBehavior that decorates [Scrollable]s with
  /// [GlowingOverscrollIndicator]s and Scrollbars based on the current
  /// platform and provided [ScrollableDetails].
  ///
  /// MaterialScrollBehavior.androidOverscrollIndicator specifies the
  /// overscroll indicator that is used on [TargetPlatform.android]. When null,
  /// ThemeData.androidOverscrollIndicator is used. If also null, the default
  /// overscroll indicator is the [GlowingOverscrollIndicator].
  const _ScrollBehaviour({
    AndroidOverscrollIndicator? androidOverscrollIndicator,
  })  : _androidOverscrollIndicator = androidOverscrollIndicator,
        super(androidOverscrollIndicator: androidOverscrollIndicator);

  final AndroidOverscrollIndicator? _androidOverscrollIndicator;

  @override
  TargetPlatform getPlatform(BuildContext context) =>
      AppTheme.of(context).platform;

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // When modifying this function, consider modifying the implementation in
    // the base class as well.
    switch (axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        switch (getPlatform(context)) {
          case TargetPlatform.linux:
          case TargetPlatform.macOS:
          case TargetPlatform.windows:
          // TODO(samuelematias): add scrollbar
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.iOS:
            return child;
        }
    }
  }

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    final theme = AppTheme.of(context);
    final indicator = _androidOverscrollIndicator ?? androidOverscrollIndicator;
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return child;
      case TargetPlatform.android:
        switch (indicator) {
          case AndroidOverscrollIndicator.stretch:
            return StretchingOverscrollIndicator(
              axisDirection: details.direction,
              child: child,
            );
          case AndroidOverscrollIndicator.glow:
            continue glow;
        }
      glow:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          axisDirection: details.direction,
          color: theme.colors.brand,
          child: child,
        );
    }
  }
}
