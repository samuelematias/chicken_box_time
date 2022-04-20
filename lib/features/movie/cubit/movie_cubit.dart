import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:movies_api/movies_api.dart';

part 'movie_state.dart';

/// {@template movie_cubit}
/// A cubit that handle the business logic.
/// {@endtemplate}
class MovieCubit extends Cubit<MovieState> {
  /// {@macro movie_cubit}
  MovieCubit(this._movieRepository) : super(const MovieState.initial());

  final MovieRepository _movieRepository;

  /// Return the list of movies.
  Future<void> getMovies() async {
    try {
      emit(const MovieState.loading());
      final response = await _movieRepository.getMovies();
      emit(
        MovieState.fetchSuccess(moviesList: response),
      );
    } on MoviesRequestFailure catch (_) {
      emit(
        const MovieState.fetchFailure(
          errorType: ErrorType.defaultApiError,
        ),
      );
    } on MoviesNotFoundFailure catch (_) {
      emit(
        const MovieState.fetchFailure(
          errorType: ErrorType.notFound,
        ),
      );
    } catch (e) {
      emit(
        const MovieState.fetchFailure(),
      );
    }
  }

  /// On changed method to textfield.
  /// Returning a filtered list of movies by what was typed.
  void onChanged(String value) {
    final list = state.moviesList
        .where(
          (e) => e.toString().toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    emit(
      state.copyWith(
        moviesListSearched: list,
        isSearchBarNotEmpty: value.isNotEmpty,
        typedContent: value,
      ),
    );
  }
}
