part of 'movie_cubit.dart';

/// Enum with possible errors types.
enum ErrorType {
  /// For an unexpected error.
  defaultError,

  /// Enter a invalidValue (e.g. numbers).
  invalidEnteredValue,

  /// For an unexpected error from API.
  defaultApiError,

  /// If the typed movie is not found.
  notFound,

  /// If no error occurs.
  none,
}

/// {@template movie_state}
/// Handle the entire [MovieState].
/// {@endtemplate}
class MovieState extends Equatable {
  /// {@macro movie_state}
  const MovieState({
    this.isLoading = false,
    this.isSearchBarNotEmpty = false,
    this.typedContent = '',
    this.moviesList = const <MovieDetails>[],
    this.moviesListSearched = const <MovieDetails>[],
    this.errorType = ErrorType.none,
  });

  /// Initial state of [MovieState].
  const MovieState.initial()
      : this(
          isLoading: false,
          isSearchBarNotEmpty: false,
          typedContent: '',
          moviesList: const <MovieDetails>[],
          moviesListSearched: const <MovieDetails>[],
          errorType: ErrorType.none,
        );

  /// Loading state of [MovieState].
  const MovieState.loading({
    String typedContent = '',
    List<MovieDetails> moviesList = const <MovieDetails>[],
    List<MovieDetails> moviesListSearched = const <MovieDetails>[],
  }) : this(
          isLoading: true,
          isSearchBarNotEmpty: false,
          typedContent: typedContent,
          moviesList: moviesList,
          moviesListSearched: moviesListSearched,
          errorType: ErrorType.none,
        );

  /// Fetching the API give an error state of [MovieState].
  const MovieState.fetchFailure({
    String typedContent = '',
    List<MovieDetails> moviesList = const <MovieDetails>[],
    List<MovieDetails> moviesListSearched = const <MovieDetails>[],
    ErrorType errorType = ErrorType.defaultError,
  }) : this(
          isLoading: false,
          isSearchBarNotEmpty: false,
          typedContent: typedContent,
          moviesList: moviesList,
          moviesListSearched: moviesListSearched,
          errorType: errorType,
        );

  /// Fetching the API was success state of [MovieState].
  const MovieState.fetchSuccess({
    String typedContent = '',
    required List<MovieDetails> moviesList,
    List<MovieDetails> moviesListSearched = const <MovieDetails>[],
  }) : this(
          isLoading: false,
          isSearchBarNotEmpty: false,
          typedContent: typedContent,
          moviesList: moviesList,
          moviesListSearched: moviesListSearched,
          errorType: ErrorType.none,
        );

  /// copyWith method for the [MovieState].
  MovieState copyWith({
    bool? isLoading,
    bool? isSearchBarNotEmpty,
    String? typedContent,
    List<MovieDetails>? moviesList,
    List<MovieDetails>? moviesListSearched,
    ErrorType? errorType,
  }) {
    return MovieState(
      isLoading: isLoading ?? this.isLoading,
      isSearchBarNotEmpty: isSearchBarNotEmpty ?? this.isSearchBarNotEmpty,
      typedContent: typedContent ?? this.typedContent,
      moviesList: moviesList ?? this.moviesList,
      moviesListSearched: moviesListSearched ?? this.moviesListSearched,
      errorType: errorType ?? this.errorType,
    );
  }

  /// If is true, indicates that request to API is loading.
  ///
  /// If is false, indicates that request to API was finished.
  final bool isLoading;

  /// If is true, indicates that a value was typed in the TextField.
  ///
  /// If is false, indicates that a value was not typed yet in the TextField.
  final bool isSearchBarNotEmpty;

  /// The content that was typed.
  final String typedContent;

  /// The movie list that was received from the API response.
  final List<MovieDetails> moviesList;

  /// The movies found by search.
  final List<MovieDetails> moviesListSearched;

  /// If has some error in the process.
  final ErrorType errorType;

  @override
  List<Object> get props => [
        isLoading,
        isSearchBarNotEmpty,
        typedContent,
        moviesList,
        moviesListSearched,
        errorType,
      ];
}
