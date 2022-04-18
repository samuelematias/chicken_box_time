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
    this.errorType = ErrorType.none,
    this.errorMessage = '',
  });

  /// Initial state of [MovieState].
  const MovieState.initial()
      : this(
          isLoading: false,
          isSearchBarNotEmpty: false,
          typedContent: '',
          moviesList: const <MovieDetails>[],
          errorType: ErrorType.none,
          errorMessage: '',
        );

  /// Loading state of [MovieState].
  const MovieState.loading({
    String typedContent = '',
    List<MovieDetails> moviesList = const <MovieDetails>[],
  }) : this(
          isLoading: true,
          isSearchBarNotEmpty: false,
          typedContent: typedContent,
          moviesList: moviesList,
          errorType: ErrorType.none,
          errorMessage: '',
        );

  /// Fetching the API give an error state of [MovieState].
  const MovieState.fetchFailure({
    String typedContent = '',
    List<MovieDetails> moviesList = const <MovieDetails>[],
    ErrorType errorType = ErrorType.defaultError,
    String errorMessage = defaultErrorMessage,
  }) : this(
          isLoading: false,
          isSearchBarNotEmpty: false,
          typedContent: typedContent,
          moviesList: moviesList,
          errorType: errorType,
          errorMessage: errorMessage,
        );

  /// Fetching the API was success state of [MovieState].
  const MovieState.fetchSuccess({
    String typedContent = '',
    required List<MovieDetails> moviesList,
  }) : this(
          isLoading: false,
          isSearchBarNotEmpty: false,
          typedContent: typedContent,
          moviesList: moviesList,
          errorType: ErrorType.none,
          errorMessage: '',
        );

  /// The content typed in the TextField state of [MovieState].
  const MovieState.typedContent({
    String typedContent = '',
    bool isSearchBarNotEmpty = false,
    List<MovieDetails> moviesList = const <MovieDetails>[],
    ErrorType errorType = ErrorType.defaultError,
    String errorMessage = 'Erro Message',
  }) : this(
          isLoading: false,
          isSearchBarNotEmpty: isSearchBarNotEmpty,
          typedContent: typedContent,
          moviesList: moviesList,
          errorType: errorType,
          errorMessage: errorMessage,
        );

  /// copyWith method for the [MovieState].
  MovieState copyWith({
    bool? isLoading,
    bool? isSearchBarNotEmpty,
    String? typedContent,
    List<MovieDetails>? moviesList,
    ErrorType? errorType,
    String? errorMessage,
  }) {
    return MovieState(
      isLoading: isLoading ?? this.isLoading,
      isSearchBarNotEmpty: isSearchBarNotEmpty ?? this.isSearchBarNotEmpty,
      typedContent: typedContent ?? this.typedContent,
      moviesList: moviesList ?? this.moviesList,
      errorType: errorType ?? this.errorType,
      errorMessage: errorMessage ?? this.errorMessage,
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

  /// If has some error in the process.
  final ErrorType errorType;

  /// Contains [errorMessage] from the [errorType].
  final String errorMessage;

  @override
  List<Object> get props => [
        isLoading,
        isSearchBarNotEmpty,
        typedContent,
        moviesList,
        errorType,
        errorMessage,
      ];
}
