import 'package:bloc_test/bloc_test.dart';
import 'package:chicken_box_time/features/movie/cubit/movie_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:movies_api/movies_api.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  group('MovieCubit', () {
    late MovieRepository movieRepository;

    setUp(() {
      movieRepository = MockMovieRepository();
    });

    test('should initial state is MovieState.initial', () {
      final movieCubit = MovieCubit(movieRepository);
      expect(movieCubit.state, const MovieState.initial());
    });
    group('getMovies', () {
      const movieDetails = MovieDetails(
        adult: false,
        backdropPath: '/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg',
        genreIds: [28, 12, 878],
        id: 634649,
        mediaType: 'movie',
        originalLanguage: 'en',
        originalTitle: 'Spider-Man: No Way Home',
        overview: 'WOW, this movie is Awesome!',
        popularity: 6925.636,
        posterPath: '/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
        releaseDate: '2021-12-15',
        title: 'Spider-Man: No Way Home',
        video: false,
        voteAverage: 0.2,
        voteCount: 11703,
      );
      setUp(() {
        when(
          () => movieRepository.getMovies(),
        ).thenAnswer((_) async => Future<List<MovieDetails>>.value([]));
      });
      blocTest<MovieCubit, MovieState>(
        'should invokes getMovies on movieRepository',
        build: () => MovieCubit(movieRepository),
        act: (cubit) => cubit.getMovies(),
        verify: (_) {
          verify(() => movieRepository.getMovies()).called(1);
        },
      );

      blocTest<MovieCubit, MovieState>(
        'should emits [loading, success] when movieRepository succeeds',
        build: () {
          when(
            () => movieRepository.getMovies(),
          ).thenAnswer(
            (_) async => Future<List<MovieDetails>>.value([movieDetails]),
          );
          return MovieCubit(movieRepository);
        },
        act: (cubit) => cubit.getMovies(),
        expect: () => const <MovieState>[
          MovieState.loading(),
          MovieState.fetchSuccess(moviesList: [movieDetails]),
        ],
      );

      blocTest<MovieCubit, MovieState>(
        'should emits [loading, failure] when movieRepository throws (defaultError)',
        build: () {
          when(
            () => movieRepository.getMovies(),
          ).thenThrow(Exception());
          return MovieCubit(movieRepository);
        },
        act: (cubit) => cubit.getMovies(),
        expect: () => const <MovieState>[
          MovieState.loading(),
          MovieState.fetchFailure(),
        ],
      );
      blocTest<MovieCubit, MovieState>(
        'should emits [loading, failure] when movieRepository '
        'throws (defaultApiError)',
        build: () {
          when(
            () => movieRepository.getMovies(),
          ).thenThrow(MoviesRequestFailure());
          return MovieCubit(movieRepository);
        },
        act: (cubit) => cubit.getMovies(),
        expect: () => const <MovieState>[
          MovieState.loading(),
          MovieState.fetchFailure(
            errorType: ErrorType.defaultApiError,
          ),
        ],
      );
      blocTest<MovieCubit, MovieState>(
        'should emits [loading, failure] when movieRepository '
        'throws (notFound)',
        build: () {
          when(
            () => movieRepository.getMovies(),
          ).thenThrow(MoviesNotFoundFailure());
          return MovieCubit(movieRepository);
        },
        act: (cubit) => cubit.getMovies(),
        expect: () => const <MovieState>[
          MovieState.loading(),
          MovieState.fetchFailure(
            errorType: ErrorType.notFound,
          ),
        ],
      );
    });
  });
}
