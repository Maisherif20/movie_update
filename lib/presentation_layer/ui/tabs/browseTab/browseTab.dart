import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/presentation_layer/ui/tabs/browseTab/browse_tab_item.dart';
import 'package:untitled/presentation_layer/ui/tabs/browseTab/browse_tab_view_model.dart';

class BrowseTabView extends StatefulWidget {
  const BrowseTabView({super.key});

  @override
  State<BrowseTabView> createState() => _BrowseTabViewState();
}

class _BrowseTabViewState extends State<BrowseTabView> {
  BrowseTabViewModel browseTabViewModel = getIt<BrowseTabViewModel>();
  @override
  void initState() {
    browseTabViewModel.getGenresMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseTabViewModel, BrowseTabState>(
      bloc: browseTabViewModel,
      builder: (context, state) {
        switch (state) {
          case BrowseTabLoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case BrowseTabErrorState():
            {
              return Column(
                children: [
                  Expanded(child: Text(state.errorMessage)),
                ],
              );
            }
          case BrowseTabSuccessState():
            {
              var genresList = state.genresResponseEntity;

              return Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Browse Category ',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => BrowseTabItem(
                          name: genresList.genresEntity![index].name!,
                          id: genresList.genresEntity![index].id!,
                        ),
                        itemCount: genresList.genresEntity!.length,
                      ),
                    )
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
