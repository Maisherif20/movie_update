import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/moviesDetails/detailsScreen.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/moviesDetails/detailsViewModel.dart';
import '../../../../../../DI/dI.dart';

class DetailsView extends StatefulWidget {
  String id;
  String description;
  DetailsView({required this.id  , required this.description});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  DetailsViewModel detailsViewModel = getIt<DetailsViewModel>();
  @override
  void initState() {
    detailsViewModel.movieDetails(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsViewModel, DetailsState>(
        bloc: detailsViewModel,
        builder: (context, state) {
          switch (state) {
            case DetailsLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case DetailsErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case DetailsSuccessState():
              {
                var movieDetails = state.detailsEntity;
                return DetailsScreen(id: widget.id, detailsEntity: movieDetails, desription: widget.description, );
              }
          }
        });
  }
}
