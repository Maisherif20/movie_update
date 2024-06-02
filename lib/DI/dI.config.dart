// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_layer/api_manager/api_manager.dart' as _i4;
import '../data_layer/dataSourceContract/browseDataSource/genres_movies_data_source.dart'
    as _i16;
import '../data_layer/dataSourceContract/browseDataSource/movie_genre_list_data_source.dart'
    as _i6;
import '../data_layer/dataSourceContract/movies_data_source.dart' as _i8;
import '../data_layer/dataSourceContract/watch_list_data_source.dart' as _i10;
import '../data_layer/dataSourceImpl/browseDataSourceImpl/genres_movies_data_source_impl.dart'
    as _i17;
import '../data_layer/dataSourceImpl/browseDataSourceImpl/movie_genre_list_data_source_impl.dart'
    as _i7;
import '../data_layer/dataSourceImpl/movies_data_source_impl.dart' as _i9;
import '../data_layer/dataSourceImpl/watchListDataSourceImpl.dart' as _i11;
import '../data_layer/firebase/firestore.dart' as _i5;
import '../data_layer/reposatoryImpl/browseRepositoryImpl/genres_movies_repository_impl.dart'
    as _i21;
import '../data_layer/reposatoryImpl/browseRepositoryImpl/movie_genre_list_repository_impl.dart'
    as _i15;
import '../data_layer/reposatoryImpl/movies_repository_impl.dart' as _i19;
import '../data_layer/reposatoryImpl/watchListRepositoryImpl.dart' as _i13;
import '../domain_layer/reposatoryContract/browseRepository/genres_movies_repository.dart'
    as _i20;
import '../domain_layer/reposatoryContract/browseRepository/movie_genre_list_repository.dart'
    as _i14;
import '../domain_layer/reposatoryContract/moviesRepository.dart' as _i18;
import '../domain_layer/reposatoryContract/watchListRepository.dart' as _i12;
import '../domain_layer/useCase/browseUseCase/genres_movies_use_case.dart'
    as _i35;
import '../domain_layer/useCase/browseUseCase/movie_genre_list_use_case.dart'
    as _i22;
import '../domain_layer/useCase/moviesDetailsUseCase.dart' as _i29;
import '../domain_layer/useCase/moviesUseCase/moreLikeUseCase.dart' as _i30;
import '../domain_layer/useCase/moviesUseCase/newReleaseUseCase.dart' as _i31;
import '../domain_layer/useCase/moviesUseCase/popularMoviesUseCase.dart'
    as _i32;
import '../domain_layer/useCase/moviesUseCase/recommendedMoviesUseCase.dart'
    as _i33;
import '../domain_layer/useCase/watchlistUseCase/addMovieUseCase.dart' as _i23;
import '../domain_layer/useCase/watchlistUseCase/allMovieUseCase.dart' as _i24;
import '../domain_layer/useCase/watchlistUseCase/checkForMovieUseCase.dart'
    as _i25;
import '../domain_layer/useCase/watchlistUseCase/deleteMovieUseCase.dart'
    as _i26;
import '../domain_layer/useCase/watchlistUseCase/listenForMovieUseCase.dart'
    as _i27;
import '../domain_layer/useCase/watchlistUseCase/updateMovieUseCase.dart'
    as _i28;
import '../presentation_layer/ui/homeScreen/homeScreenViewModel.dart' as _i3;
import '../presentation_layer/ui/tabs/browseTab/browse_tab_view_model.dart'
    as _i43;
import '../presentation_layer/ui/tabs/browseTab/movieGenreList/movie_genre_list_view_model.dart'
    as _i42;
import '../presentation_layer/ui/tabs/homeTab/movies/MoreLikeMovies/moreLikeViewModel.dart'
    as _i38;
import '../presentation_layer/ui/tabs/homeTab/movies/moviesDetails/detailsViewModel.dart'
    as _i46;
import '../presentation_layer/ui/tabs/homeTab/movies/newReleaseMovies/newReleaseViewModel.dart'
    as _i47;
import '../presentation_layer/ui/tabs/homeTab/movies/popularMovies/popularMovieViewModel.dart'
    as _i34;
import '../presentation_layer/ui/tabs/homeTab/movies/recommendedMovies/recommendedViewModel.dart'
    as _i36;
import '../presentation_layer/ui/tabs/watchListTab/watchListViewModels/addWatchListViewModel.dart'
    as _i41;
import '../presentation_layer/ui/tabs/watchListTab/watchListViewModels/allMoviesInWatchListViewModel.dart'
    as _i39;
import '../presentation_layer/ui/tabs/watchListTab/watchListViewModels/checkInViewModel.dart'
    as _i45;
import '../presentation_layer/ui/tabs/watchListTab/watchListViewModels/deleteMovieViewModel.dart'
    as _i44;
import '../presentation_layer/ui/tabs/watchListTab/watchListViewModels/listenMovieViewModel.dart'
    as _i37;
import '../presentation_layer/ui/tabs/watchListTab/watchListViewModels/updateMovieViewModel.dart'
    as _i40;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HomeScreenViewModel>(() => _i3.HomeScreenViewModel());
    gh.singleton<_i4.ApiManager>(() => _i4.ApiManager());
    gh.singleton<_i5.Firestore>(() => _i5.Firestore());
    gh.factory<_i6.MovieGenreListDataSource>(() =>
        _i7.MovieGenreListDataSourceImpl(apiManager: gh<_i4.ApiManager>()));
    gh.factory<_i8.MoviesDataSource>(
        () => _i9.MoviesDataSourceImpl(apiManager: gh<_i4.ApiManager>()));
    gh.factory<_i10.WatchListDataSource>(
        () => _i11.WatchListDataSourceImpl(firestore: gh<_i5.Firestore>()));
    gh.factory<_i12.WatchListRepository>(() => _i13.WatchListRepositoryImpl(
        watchListDataSource: gh<_i10.WatchListDataSource>()));
    gh.factory<_i14.MovieGenreListRepository>(() =>
        _i15.MovieGenreLIstRepositoryImpl(
            movieGenreListDataSource: gh<_i6.MovieGenreListDataSource>()));
    gh.factory<_i16.GenresMoviesDataSource>(() =>
        _i17.GenresMoviesDataSourceImpl(apiManager: gh<_i4.ApiManager>()));
    gh.factory<_i18.MoviesReposatory>(() => _i19.MoviesReposatoryImpl(
        moviesDataSource: gh<_i8.MoviesDataSource>()));
    gh.factory<_i20.GenresMoviesRepository>(() =>
        _i21.GenresMoviesRepositoryImpl(
            genresMoviesDataSource: gh<_i16.GenresMoviesDataSource>()));
    gh.factory<_i22.MovieGenreListUseCase>(() => _i22.MovieGenreListUseCase(
        movieGenreListRepository: gh<_i14.MovieGenreListRepository>()));
    gh.factory<_i23.AddMovieUseCase>(() => _i23.AddMovieUseCase(
        watchListRepository: gh<_i12.WatchListRepository>()));
    gh.factory<_i24.AllMoviesUseCase>(() => _i24.AllMoviesUseCase(
        watchListRepository: gh<_i12.WatchListRepository>()));
    gh.factory<_i25.CheckInFireBaseUseCase>(() => _i25.CheckInFireBaseUseCase(
        watchListRepository: gh<_i12.WatchListRepository>()));
    gh.factory<_i26.DeleteMovieUseCase>(() => _i26.DeleteMovieUseCase(
        watchListRepository: gh<_i12.WatchListRepository>()));
    gh.factory<_i27.ListenForMovieUseCase>(() => _i27.ListenForMovieUseCase(
        watchListRepository: gh<_i12.WatchListRepository>()));
    gh.factory<_i28.UpdateMovieUseCase>(() => _i28.UpdateMovieUseCase(
        watchListRepository: gh<_i12.WatchListRepository>()));
    gh.factory<_i29.MoviesDetailsUseCase>(() => _i29.MoviesDetailsUseCase(
        moviesReposatory: gh<_i18.MoviesReposatory>()));
    gh.factory<_i30.MoreLikeUseCase>(() =>
        _i30.MoreLikeUseCase(moviesReposatory: gh<_i18.MoviesReposatory>()));
    gh.factory<_i31.NewReleaseMoviesUseCase>(() => _i31.NewReleaseMoviesUseCase(
        moviesReposatory: gh<_i18.MoviesReposatory>()));
    gh.factory<_i32.PopularMoviesUseCase>(() => _i32.PopularMoviesUseCase(
        moviesReposatory: gh<_i18.MoviesReposatory>()));
    gh.factory<_i33.RecommendedMoviesUseCase>(() =>
        _i33.RecommendedMoviesUseCase(
            moviesReposatory: gh<_i18.MoviesReposatory>()));
    gh.factory<_i34.PopularMovieViewModel>(() => _i34.PopularMovieViewModel(
          popularMoviesUseCase: gh<_i32.PopularMoviesUseCase>(),
          newReleaseMoviesUseCase: gh<_i31.NewReleaseMoviesUseCase>(),
        ));
    gh.factory<_i35.GenresMoviesUseCase>(() => _i35.GenresMoviesUseCase(
        genresMoviesRepository: gh<_i20.GenresMoviesRepository>()));
    gh.factory<_i36.RecommendedMovieViewModel>(() =>
        _i36.RecommendedMovieViewModel(
            recommendedMoviesUseCase: gh<_i33.RecommendedMoviesUseCase>()));
    gh.factory<_i37.ListenForMovieViewModel>(() => _i37.ListenForMovieViewModel(
        listenForMovieUseCase: gh<_i27.ListenForMovieUseCase>()));
    gh.factory<_i38.MoreLikeViewModel>(() =>
        _i38.MoreLikeViewModel(moreLikeUseCase: gh<_i30.MoreLikeUseCase>()));
    gh.factory<_i39.AllMoviesViewModel>(() =>
        _i39.AllMoviesViewModel(allMoviesUseCase: gh<_i24.AllMoviesUseCase>()));
    gh.factory<_i40.UpdateMovieViewModel>(() => _i40.UpdateMovieViewModel(
        updateMovieUseCase: gh<_i28.UpdateMovieUseCase>()));
    gh.factory<_i41.AddWatchListViewModel>(() => _i41.AddWatchListViewModel(
        addMovieUseCase: gh<_i23.AddMovieUseCase>()));
    gh.factory<_i42.MovieGenreListViewModel>(() => _i42.MovieGenreListViewModel(
        movieGenreListUseCase: gh<_i22.MovieGenreListUseCase>()));
    gh.factory<_i43.BrowseTabViewModel>(() => _i43.BrowseTabViewModel(
        genresMoviesUseCase: gh<_i35.GenresMoviesUseCase>()));
    gh.factory<_i44.DeleteMovieViewModel>(() => _i44.DeleteMovieViewModel(
        deleteMovieUseCase: gh<_i26.DeleteMovieUseCase>()));
    gh.factory<_i45.CheckInViewModel>(() => _i45.CheckInViewModel(
        checkInFireBaseUseCase: gh<_i25.CheckInFireBaseUseCase>()));
    gh.factory<_i46.DetailsViewModel>(() => _i46.DetailsViewModel(
        moviesDetailsUseCase: gh<_i29.MoviesDetailsUseCase>()));
    gh.factory<_i47.NewReleaseMoviesViewModel>(() =>
        _i47.NewReleaseMoviesViewModel(
            newReleaseMoviesUseCase: gh<_i31.NewReleaseMoviesUseCase>()));
    return this;
  }
}
