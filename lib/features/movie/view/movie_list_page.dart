import 'package:chicken_box_time/features/movie/cubit/movie_cubit.dart';
import 'package:design_system/design_system.dart' as ds;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final data = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorTheme.background,
          appBar: AppBar(
            backgroundColor: colorTheme.brand,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch<dynamic>(
                    context: context,
                    delegate: ds.SearchBar(
                      data: data,
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: colorTheme.font,
                ),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    _MovieListState(state: state),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MovieListState extends StatelessWidget {
  const _MovieListState({
    Key? key,
    required this.state,
  }) : super(key: key);

  final MovieState state;

  @override
  Widget build(BuildContext context) {
    final theme = ds.AppTheme.of(context);
    final colorTheme = theme.colors;
    if (state.isLoading) {
      return const _LoadingIndicator();
    } else if (state.moviesList.isNotEmpty) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.moviesList.length,
        itemBuilder: (_, index) {
          final movie = state.moviesList[index];
          return ds.Card(
            imageLeading: movie.posterPath!.getMovieThumbnail(),
            title: movie.title!,
            subtitle: '${movie.popularity}',
          );
        },
        separatorBuilder: (_, __) => const _VerticalDivider(),
      );
    } else if (state.errorType == ErrorType.defaultApiError) {
      return ds.Text(
        state.errorMessage,
        key: const Key('default_api_error'),
        style: ds.CustomTextStyle.titleMedium,
        color: colorTheme.fontDanger,
      );
    } else if (state.errorType == ErrorType.defaultError) {
      return ds.Text(
        state.errorMessage,
        key: const Key('default_api_error'),
        style: ds.CustomTextStyle.titleMedium,
        color: colorTheme.fontDanger,
      );
    } else if (state.errorType == ErrorType.notFound) {
      return ds.Text(
        state.errorMessage,
        key: const Key('not_found'),
        style: ds.CustomTextStyle.titleMedium,
        color: colorTheme.fontWarning,
      );
    }
    return Container();
  }
}

/// Widget responsible for creating the spaces between the widgets
class _VerticalDivider extends StatelessWidget {
  /// Creates a new instance of [_VerticalDivider].
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

/// The widget responsible for creating the LoadingIndicator.
class _LoadingIndicator extends StatelessWidget {
  /// Creates a new instance of [_LoadingIndicator].
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
