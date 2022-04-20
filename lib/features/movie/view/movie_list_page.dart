import 'package:cached_network_image/cached_network_image.dart';
import 'package:chicken_box_time/features/movie/cubit/movie_cubit.dart';
import 'package:chicken_box_time/l10n/l10n.dart';
import 'package:design_system/design_system.dart' as ds;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:movies_api/movies_api.dart';

/// {@template movie_list_page}
/// The page responsabilite to render the list of movies.
/// {@endtemplate}
class MovieListPage extends StatelessWidget {
  /// {@macro movie_list_page}
  const MovieListPage({
    Key? key,
  }) : super(key: key);

  /// {@macro movie_list_page.route}
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(
        context.read<MovieRepository>(),
      )..getMovies(),
      child: const _MovieListView(),
    );
  }
}

class _MovieListView extends StatelessWidget {
  const _MovieListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    final spacingTheme = theme.spacing;
    return Scaffold(
      backgroundColor: colorTheme.background,
      body: SafeArea(
        top: false,
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: BlocBuilder<MovieCubit, MovieState>(
                  builder: (context, state) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(spacingTheme.large),
                        child: Column(
                          children: [
                            _MovieListState(
                              state: state,
                              minWidth: constraints.maxWidth,
                              minHeight: constraints.maxHeight,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MovieListState extends StatelessWidget {
  const _MovieListState({
    Key? key,
    required this.state,
    required this.minWidth,
    required this.minHeight,
  }) : super(key: key);
  final double minWidth;
  final double minHeight;
  final MovieState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    if (state.isLoading) {
      return _CenterWidgetInsideSingleChildScrollView(
        minWidth: minWidth,
        minHeight: minHeight,
        child: const _LoadingIndicator(),
      );
    } else if (state.moviesList.isNotEmpty) {
      final moviesList = state.moviesListSearched.isEmpty
          ? state.moviesList
          : state.moviesListSearched;
      final movieNotFoundBySearch =
          state.isSearchBarNotEmpty && state.moviesListSearched.isEmpty;
      return _MovieList(
        movieNotFoundBySearch: movieNotFoundBySearch,
        moviesList: moviesList,
      );
    } else if (state.errorType == ErrorType.defaultApiError) {
      return _CenterWidgetInsideSingleChildScrollView(
        minWidth: minWidth,
        minHeight: minHeight,
        child: ds.Text(
          l10n.defaultApiErrorMessage,
          key: const Key('default_api_error'),
          style: ds.CustomTextStyle.titleMedium,
          color: colorTheme.fontDanger,
        ),
      );
    } else if (state.errorType == ErrorType.defaultError) {
      return _CenterWidgetInsideSingleChildScrollView(
        minWidth: minWidth,
        minHeight: minHeight,
        child: ds.Text(
          l10n.defaultErrorMessage,
          key: const Key('default_error'),
          style: ds.CustomTextStyle.titleMedium,
          color: colorTheme.fontDanger,
        ),
      );
    } else if (state.errorType == ErrorType.notFound) {
      return _CenterWidgetInsideSingleChildScrollView(
        minWidth: minWidth,
        minHeight: minHeight,
        child: Column(
          children: [
            ds.Text(
              l10n.notfoundErrorMessage,
              key: const Key('not_found'),
              style: ds.CustomTextStyle.titleMedium,
              color: colorTheme.fontWarning,
            ),
            const _VerticalDivider(),
            ds.Button(
              title: l10n.retryButtonMessage,
              onTap: () => context.read<MovieCubit>().getMovies(),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _MovieList extends StatelessWidget {
  const _MovieList({
    Key? key,
    required this.movieNotFoundBySearch,
    required this.moviesList,
  }) : super(key: key);

  final bool movieNotFoundBySearch;
  final List<MovieDetails> moviesList;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    return Column(
      children: [
        TextField(
          onChanged: context.read<MovieCubit>().onChanged,
          style: TextStyle(color: colorTheme.font),
          decoration: InputDecoration(
            prefixIconColor: colorTheme.brand,
            suffixIconColor: colorTheme.brand,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            iconColor: colorTheme.brand,
            prefixIcon: Icon(
              Icons.search,
              color: colorTheme.brand,
            ),
            fillColor: colorTheme.background,
          ),
          cursorColor: colorTheme.brand,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: movieNotFoundBySearch
              ? Column(
                  children: [
                    ds.Text(
                      l10n.movieNotFoundBySearch,
                      key: const Key('movie_not_found_by_search'),
                      style: ds.CustomTextStyle.labelMedium,
                      color: colorTheme.fontWarning,
                    ),
                    const _VerticalDivider(),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: moviesList.length,
          itemBuilder: (_, index) {
            final movie = moviesList[index];
            return ds.Card(
              onTap: () => showBarModalBottomSheet<dynamic>(
                expand: false,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => _MovieDetails(
                  imageUrl: movie.posterPath!.getMovieThumbnail(),
                  title: movie.title!,
                  description: movie.overview!,
                ),
              ),
              imageLeading: movie.posterPath!.getMovieThumbnail(),
              title: movie.title!,
              subtitle: '${l10n.moviePopularity}: ${movie.popularity}',
            );
          },
          separatorBuilder: (_, __) => const _VerticalDivider(),
        ),
      ],
    );
  }
}

class _MovieDetails extends StatelessWidget {
  const _MovieDetails({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    final spacingTheme = theme.spacing;
    return SingleChildScrollView(
      child: Container(
        color: colorTheme.background,
        padding: EdgeInsets.all(spacingTheme.large),
        child: Column(
          children: [
            ds.Text(
              title,
              style: ds.CustomTextStyle.subtitleMedium,
              color: colorTheme.font,
            ),
            const _VerticalDivider(),
            CachedNetworkImage(
              fadeInDuration: const Duration(milliseconds: 400),
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              width: 175,
              placeholder: (context, url) => Icon(
                Icons.image,
                color: colorTheme.font,
              ),
              errorWidget: (context, url, dynamic error) => Icon(
                Icons.broken_image,
                color: colorTheme.font,
              ),
            ),
            const _VerticalDivider(),
            ds.Text(
              description,
              style: ds.CustomTextStyle.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = ds.AppTheme.of(context);
    final spacingTheme = theme.spacing;
    return SizedBox(height: spacingTheme.medium);
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(colorTheme.brand),
    );
  }
}

class _CenterWidgetInsideSingleChildScrollView extends StatelessWidget {
  const _CenterWidgetInsideSingleChildScrollView({
    Key? key,
    required this.minWidth,
    required this.minHeight,
    required this.child,
  }) : super(key: key);

  final double minWidth;
  final double minHeight;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        minHeight: minHeight,
      ),
      child: Center(child: child),
    );
  }
}
