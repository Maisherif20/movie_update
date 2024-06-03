import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/MoreLikeMovies/moreLikeViewModel.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/recommendedMovies/recommendedItemWidget.dart';
import 'package:untitled/presentation_layer/ui/tabs/searchTab/searchListWidget.dart';
import 'package:untitled/presentation_layer/ui/tabs/searchTab/searchViewMdel.dart';
import '../../../../../../DI/dI.dart';

class SearchView extends StatefulWidget {
  String query;

  SearchView({required this.query});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel searchViewModel = getIt<SearchViewModel>();

  @override
  void initState() {
    searchViewModel.searchForMovie(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewModel, SearchState>(
        bloc: searchViewModel,
        builder: (context, state) {
          switch (state) {
            case SearchLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case SearchErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case SearchSuccessState():
              {
                var searchList = state.moviesEntity;
                print(searchList.resultEntity![0].genreIds![0]);
                return Container(
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: searchList.resultEntity!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SearchListWidget(
                                  title:
                                      searchList.resultEntity![index].title ??
                                          "No title",
                                  image: searchList
                                          .resultEntity![index].posterPath ??
                                      "No posterPath ",
                                  releaseDate: searchList
                                          .resultEntity![index].releaseDate ??
                                      "No releaseDate ",
                                  overView: searchList
                                          .resultEntity![index].overview ??
                                      "No overview",
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }
          }
        });
  }
}
