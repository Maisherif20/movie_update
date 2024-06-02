import 'package:flutter/material.dart';
import 'package:untitled/DI/dI.dart';
import 'package:untitled/domain_layer/entities/genresEntity/GenresEntity.dart';
import 'package:untitled/generated/assets.dart';
import 'package:untitled/presentation_layer/ui/tabs/browseTab/movieGenreList/movie_genre_list_view.dart';
import 'package:untitled/presentation_layer/ui/tabs/browseTab/movieGenreList/movie_genre_list_view_model.dart';


class BrowseTabItem extends StatefulWidget {
  const BrowseTabItem({super.key,required this.name,required this.id});
  final String name;
  final int id;
  @override
  State<BrowseTabItem> createState() => _BrowseTabItemState();
}

class _BrowseTabItemState extends State<BrowseTabItem> {
   MovieGenreListViewModel movieGenreListViewModel = getIt<MovieGenreListViewModel>();
   @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        onClickedCategory(GenresEntity(id:widget.id,name: widget.name),context);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(Assets.defaultImage),
          Text(widget.name,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white,)),
        ],
      ),
    );
  }
  void onClickedCategory(var arg,context){
    Navigator.pushNamed(context,MovieGenreListView.routeName,arguments: arg);
    setState(() {
    });
  }
}
