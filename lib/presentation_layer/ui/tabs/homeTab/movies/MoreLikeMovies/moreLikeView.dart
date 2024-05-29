import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/MoreLikeMovies/moreLikeViewModel.dart';
import 'package:untitled/presentation_layer/ui/tabs/homeTab/movies/recommendedMovies/recommendedItemWidget.dart';
import '../../../../../../DI/dI.dart';

class MoreLikeView extends StatefulWidget {
  String id;
  MoreLikeView({required this.id});

  @override
  State<MoreLikeView> createState() => _MoreLikeViewState();
}

class _MoreLikeViewState extends State<MoreLikeView> {
  MoreLikeViewModel moreLikeViewModel= getIt<MoreLikeViewModel>();
  @override
  void initState() {
    moreLikeViewModel.getMoreLike(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreLikeViewModel, MoreLikeState>(
        bloc: moreLikeViewModel,
        builder: (context, state) {
          switch (state) {
            case MoreLikeLoadingState():
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case MoreLikeErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                  ],
                );
              }
            case MoreLikeSuccessState():
              {
                var moreLike = state.moviesEntity;
                print(moreLike.resultEntity![0].genreIds![0]);
                return Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Color.fromRGBO(40, 42, 40, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("More Like this" , style: TextStyle(color: Colors.white , fontSize: 14.sp),),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: moreLike.resultEntity!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: RecommendedItemWidget(
                                        imagePoster: moreLike
                                            .resultEntity![index].posterPath ??
                                            "No image",
                                        id: moreLike.resultEntity![index].id
                                            .toString() ??
                                            "No Id",
                                        title: moreLike
                                            .resultEntity![index].title ??
                                            "No title",
                                        releaseDate: moreLike
                                            .resultEntity![index].releaseDate ??
                                            "No releaseDate",
                                        rate: moreLike
                                            .resultEntity![index].voteAverage
                                            .toString() ??
                                            "No rate", moviesEntity: moreLike, index: index,
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ));
              }
          }
        });
  }
}
