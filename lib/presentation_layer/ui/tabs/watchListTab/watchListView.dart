import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/data_layer/firebase/firebaseAuth.dart';
import 'package:untitled/presentation_layer/ui/tabs/watchListTab/watch_list_widget.dart';
import 'package:untitled/presentation_layer/ui/tabs/watchListTab/watchListViewModels/listenMovieViewModel.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  // AddWatchListViewModel watchListViewModel = getIt<AddWatchListViewModel>();
  late ListenForMovieViewModel listenForMovieViewModel;

  @override
  void initState() {
    listenForMovieViewModel = getIt<ListenForMovieViewModel>();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WatchListView oldWidget) {
    listenForMovieViewModel = getIt<ListenForMovieViewModel>();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<FirebaseAuthUser>(context, listen: false);
    listenForMovieViewModel.listenForMovie(uid: authProvider.databaseUser!.id!);
    return BlocBuilder<ListenForMovieViewModel, WatchListState>(
        bloc: listenForMovieViewModel,
        builder: (context, state) {
          switch (state) {
            case WatchListLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case WatchListErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case WatchListSuccessState():
              {
                var movieList = state.movie;
                return ListView.builder(
                  itemBuilder: (context, index) => WatchListWidget(
                      title: movieList[index].title!,
                      id: movieList[index].id.toString(),
                      image: movieList[index].posterImagePath!,
                      releaseDate: movieList[index].releaseData!),
                  itemCount: movieList.length,
                );
              }
          }
        });
  }
}
