import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/domain_layer/entities/genresEntity/GenresEntity.dart';
import 'package:untitled/presentation_layer/ui/tabs/browseTab/movieGenreList/movie_genre_list_view_model.dart';
import 'package:untitled/presentation_layer/ui/tabs/browseTab/movieGenreList/movie_list_item.dart';


class MovieGenreListView extends StatefulWidget {
  const MovieGenreListView({super.key});
  static const String routeName ='Movies_List';
  @override
  State<MovieGenreListView> createState() => _MovieGenreListViewState();
}

class _MovieGenreListViewState extends State<MovieGenreListView> {
  late MovieGenreListViewModel movieGenreListViewModel;
  // late GenresEntity args;

  @override
  void initState() {
    movieGenreListViewModel = getIt<MovieGenreListViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as GenresEntity;
    movieGenreListViewModel.getMovieGenreList(args.id!);
    return BlocBuilder<MovieGenreListViewModel,MovieGenreListState>(
      bloc: movieGenreListViewModel,
      builder: (context,state){
        switch (state){
          case MovieGenreListLoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case MovieGenreListErrorState():
            {
              return Column(
                children: [
                  Expanded(child: Text(state.errorMessage)),
                ],
              );
            }
          case MovieGenreListSuccessState():
            {
              var movieList = state.movieDiscoverEntity;
              return Scaffold(
                backgroundColor: Colors.black,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30 , left: 10),
                      child: Row(
                        children: [
                          InkWell(onTap: (){
                            Navigator.pop(context);
                          },child: const Icon(Icons.arrow_back , color: Colors.white,)),
                          const SizedBox(width: 10,),
                          Text("${args.name} List" , style: const TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 30),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => MovieListItem(
                            title:movieList.resultEntity![index].originalTitle ?? 'No Title',
                            image: movieList.resultEntity![index].posterPath ?? 'No Image',
                            releaseDate: movieList.resultEntity![index].releaseDate ?? 'No releaseDate',
                            // overView: movieList.resultEntity![index].overview!,
                          ),
                          itemCount: movieList.resultEntity!.length),
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
