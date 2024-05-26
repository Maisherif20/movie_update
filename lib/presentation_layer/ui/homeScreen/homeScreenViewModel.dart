import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeTabState());
  void getTabs(int indexTab) {
    if (indexTab == 0) {
      emit(HomeTabState());
    }
    if (indexTab == 1) {
      emit(SearchTabState());
    }
    if (indexTab == 2) {
      emit(BrowseTabState());
    }
    if (indexTab == 3) {
      emit(WatchListTabState());
    }
  }
}

sealed class HomeScreenState {}

class HomeTabState extends HomeScreenState {}

class SearchTabState extends HomeScreenState {}

class BrowseTabState extends HomeScreenState {}

class WatchListTabState extends HomeScreenState {}
